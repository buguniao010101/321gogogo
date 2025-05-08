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
        // 默认向左
        targetOffsetX = -offsetX;
        currentOffsetX = targetOffsetX;
    }

    void LateUpdate()
    {
        if (!target) return;

        // 获取角色方向（根据localScale判断，或你可以改成看输入）
        bool facingRight = target.localScale.x > 0;
        targetOffsetX = facingRight ? offsetX : -offsetX;

        // 平滑过渡 offsetX，避免突变
        currentOffsetX = Mathf.Lerp(currentOffsetX, targetOffsetX, Time.deltaTime * 5f);

        // 计算相机目标位置（只改 X）
        float targetX = target.position.x + currentOffsetX;
        Vector3 desiredPosition = new Vector3(targetX, fixedY, fixedZ);

        // 平滑移动
        transform.position = Vector3.SmoothDamp(transform.position, desiredPosition, ref velocity, smoothSpeed);
    }
}
