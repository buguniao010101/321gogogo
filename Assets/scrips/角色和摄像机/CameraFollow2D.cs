using UnityEngine;

public class CameraFollow2D : MonoBehaviour
{
    [SerializeField] private Transform target;           // ��ɫ
    [SerializeField] private float smoothSpeed = 0.2f;   // ԽСԽƽ��
    [SerializeField] private float offsetX = 3f;         // ����ƫ��
    [SerializeField] private float fixedY = 2f;          // �̶� Y
    [SerializeField] private float fixedZ = -10f;        // �̶� Z��͸�ӣ�

    private float currentOffsetX;       // ��ǰ����ʹ�õ�ƫ��
    private float targetOffsetX;        // ���ݳ����Ŀ��ƫ��
    private Vector3 velocity = Vector3.zero;

    void Start()
    {
        // Ĭ������
        targetOffsetX = -offsetX;
        currentOffsetX = targetOffsetX;
    }

    void LateUpdate()
    {
        if (!target) return;

        // ��ȡ��ɫ���򣨸���localScale�жϣ�������Ըĳɿ����룩
        bool facingRight = target.localScale.x > 0;
        targetOffsetX = facingRight ? offsetX : -offsetX;

        // ƽ������ offsetX������ͻ��
        currentOffsetX = Mathf.Lerp(currentOffsetX, targetOffsetX, Time.deltaTime * 5f);

        // �������Ŀ��λ�ã�ֻ�� X��
        float targetX = target.position.x + currentOffsetX;
        Vector3 desiredPosition = new Vector3(targetX, fixedY, fixedZ);

        // ƽ���ƶ�
        transform.position = Vector3.SmoothDamp(transform.position, desiredPosition, ref velocity, smoothSpeed);
    }
}
