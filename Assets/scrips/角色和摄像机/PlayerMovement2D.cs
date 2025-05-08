using UnityEngine;

public class PlayerMovement2D : MonoBehaviour
{
    [Header("�ƶ�����")]
    public float moveSpeed = 5f;
    public float jumpForce = 8f;

    [Header("��Ծ�ָ�")]
    public float fallMultiplier = 2f;       // ����ʱ��������
    public float lowJumpMultiplier = 1.5f;  // �ɿ�Wʱ����������

    [Header("��ת����")]
    public float flipOffset = 3.5f;         // ���ĵ㵽���½ǵ�ƫ��ֵ������ Inspector ����

    [Header("������")]
    public Transform groundCheck;
    public float groundDistance = 0.2f;
    public LayerMask groundMask;

    private Rigidbody rb;
    private bool isGrounded;
    private bool facingLeft = true;
    private Animator animator;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        rb.constraints = RigidbodyConstraints.FreezeRotation | RigidbodyConstraints.FreezePositionZ;

        animator = GetComponent<Animator>();
    }

    void Update()
    {
        // ������
        isGrounded = Physics.CheckSphere(groundCheck.position, groundDistance, groundMask);

        float moveInput = Input.GetAxisRaw("Horizontal");

        // �ƶ�
        Vector3 velocity = rb.velocity;
        velocity.x = moveInput * moveSpeed;
        rb.velocity = velocity;

        // ��Ծ
        if (Input.GetKeyDown(KeyCode.W) && isGrounded)
        {
            rb.velocity = new Vector3(rb.velocity.x, 0f, 0f); // ���Y���ٶ�
            rb.AddForce(Vector3.up * jumpForce, ForceMode.Impulse);
        }

        // ����Ȼ����Ծ����
        if (rb.velocity.y < 0)
        {
            rb.velocity += Vector3.up * Physics.gravity.y * (fallMultiplier - 1) * Time.deltaTime;
        }
        else if (rb.velocity.y > 0 && !Input.GetKey(KeyCode.W))
        {
            rb.velocity += Vector3.up * Physics.gravity.y * (lowJumpMultiplier - 1) * Time.deltaTime;
        }

        // ��ת���򣨺�λ�ò�����
        if (moveInput < 0 && !facingLeft)
        {
            Flip();
        }
        else if (moveInput > 0 && facingLeft)
        {
            Flip();
        }

        // ����������ȡ����ֵ���⸺��Ӱ��
        animator.SetFloat("Speed", Mathf.Abs(moveInput));
    }

    void Flip()
    {
        facingLeft = !facingLeft;

        // ��תScale
        Vector3 scale = transform.localScale;
        scale.x *= -1;
        transform.localScale = scale;

        // λ�ò���
        Vector3 pos = transform.position;
        pos.x += facingLeft ? -flipOffset * 2 : flipOffset * 2;
        transform.position = pos;
    }
}
