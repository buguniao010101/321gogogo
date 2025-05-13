using UnityEngine;

public class CameraFollow2D : MonoBehaviour
{
    [SerializeField] private Transform target;           // 角色
    [SerializeField] private float smoothSpeed = 0.2f;   // 越小越平滑
    [SerializeField] private float offsetX = 3f;         // 横向偏移
    [SerializeField] private float fixedY = 2f;          // 固定 Y
    [SerializeField] private float fixedZ = -10f;        // 固定 Z（透视）

    private float currentOffsetX;       // 当前正在使用的偏移
    private float targetOffsetX;        // 根据朝向的目标偏移
    private Vector3 velocity = Vector3.zero;

    void Start()
    {
        // 默认向右
        targetOffsetX = offsetX;
        currentOffsetX = targetOffsetX;
    }

    void LateUpdate()
    {
        if (!target) return;

        // 获取角色方向（根据localScale判断）
        bool facingRight = target.localScale.x > 0;

        // 如果角色朝右，偏移量为正，朝左则为负
        targetOffsetX = facingRight ? offsetX : -offsetX;

        // 平滑过渡 offsetX
        currentOffsetX = Mathf.Lerp(currentOffsetX, targetOffsetX, Time.deltaTime * 5f);

        // 计算相机目标位置
        float targetX = target.position.x + currentOffsetX;

        // 限制相机X轴范围（如果有需要，可以根据实际情况调整范围）
        targetX = Mathf.Clamp(targetX, -237f, 259f);

        // 计算期望的相机位置
        Vector3 desiredPosition = new Vector3(targetX, fixedY, fixedZ);

        // 平滑移动相机位置
        transform.position = Vector3.SmoothDamp(transform.position, desiredPosition, ref velocity, smoothSpeed);
    }
}
