using UnityEngine;

public class PlayerMovement2D : MonoBehaviour
{
    [Header("移动参数")]
    public float moveSpeed = 5f;
    public float jumpForce = 8f;

    [Header("跳跃手感")]
    public float fallMultiplier = 2f;       // 下落时重力倍数
    public float lowJumpMultiplier = 1.5f;  // 松开W时的上升减速

    [Header("翻转参数")]
    public float flipOffset = 3.5f;         // 中心点到左下角的偏移值，可在 Inspector 调整

    [Header("检测地面")]
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
        // 地面检测
        isGrounded = Physics.CheckSphere(groundCheck.position, groundDistance, groundMask);

        float moveInput = Input.GetAxisRaw("Horizontal");

        // 移动
        Vector3 velocity = rb.velocity;
        velocity.x = moveInput * moveSpeed;
        rb.velocity = velocity;

        // 跳跃
        if (Input.GetKeyDown(KeyCode.W) && isGrounded)
        {
            rb.velocity = new Vector3(rb.velocity.x, 0f, 0f); // 清除Y轴速度
            rb.AddForce(Vector3.up * jumpForce, ForceMode.Impulse);
        }

        // 更自然的跳跃曲线
        if (rb.velocity.y < 0)
        {
            rb.velocity += Vector3.up * Physics.gravity.y * (fallMultiplier - 1) * Time.deltaTime;
        }
        else if (rb.velocity.y > 0 && !Input.GetKey(KeyCode.W))
        {
            rb.velocity += Vector3.up * Physics.gravity.y * (lowJumpMultiplier - 1) * Time.deltaTime;
        }

        // 翻转朝向（含位置补偿）
        if (moveInput < 0 && !facingLeft)
        {
            Flip();
        }
        else if (moveInput > 0 && facingLeft)
        {
            Flip();
        }

        // 动画参数：取绝对值避免负数影响
        animator.SetFloat("Speed", Mathf.Abs(moveInput));
    }

    void Flip()
    {
        facingLeft = !facingLeft;

        // 翻转Scale
        Vector3 scale = transform.localScale;
        scale.x *= -1;
        transform.localScale = scale;

        // 位置补偿
        Vector3 pos = transform.position;
        pos.x += facingLeft ? -flipOffset * 2 : flipOffset * 2;
        transform.position = pos;
    }
}
