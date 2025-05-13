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
        targetOffsetX = offsetX;
        currentOffsetX = targetOffsetX;
    }

    void LateUpdate()
    {
        if (!target) return;

        // ��ȡ��ɫ���򣨸���localScale�жϣ�
        bool facingRight = target.localScale.x > 0;

        // �����ɫ���ң�ƫ����Ϊ����������Ϊ��
        targetOffsetX = facingRight ? offsetX : -offsetX;

        // ƽ������ offsetX
        currentOffsetX = Mathf.Lerp(currentOffsetX, targetOffsetX, Time.deltaTime * 5f);

        // �������Ŀ��λ��
        float targetX = target.position.x + currentOffsetX;

        // �������X�᷶Χ���������Ҫ�����Ը���ʵ�����������Χ��
        targetX = Mathf.Clamp(targetX, -237f, 259f);

        // �������������λ��
        Vector3 desiredPosition = new Vector3(targetX, fixedY, fixedZ);

        // ƽ���ƶ����λ��
        transform.position = Vector3.SmoothDamp(transform.position, desiredPosition, ref velocity, smoothSpeed);
    }
}
