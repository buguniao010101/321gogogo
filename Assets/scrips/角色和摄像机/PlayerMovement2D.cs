using UnityEngine;

public class PlayerMovement2D : MonoBehaviour
{
    [Header("移动参数")]
    public float moveSpeed = 5f;
    public float jumpForce = 8f;

    [Header("骑车参数")]
    public float acceleration = 1f;
    public float maxBikeSpeed = 10f;
    public float deceleration = 5f;
    private float currentBikeSpeed = 0f;

    [Header("跳跃手感")]
    public float fallMultiplier = 2f;
    public float lowJumpMultiplier = 1.5f;

    [Header("检测地面")]
    public Transform groundCheck;
    public float groundDistanceWalk = 0.4f;
    public float groundDistanceRide = 0.2f;
    public LayerMask groundMask;

    [Header("翻转参数")]
    public float flipOffset = 3.5f;  // 控制翻转时左右偏移

    private Rigidbody rb;
    private bool isGrounded;
    private bool facingLeft = false;
    private Animator animator;
    private bool isRiding = false;

    void Start()
    {
        rb = GetComponent<Rigidbody>();
        rb.constraints = RigidbodyConstraints.FreezeRotation | RigidbodyConstraints.FreezePositionZ;
        animator = GetComponent<Animator>();
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.E))
        {
            isRiding = !isRiding;
            animator.SetBool("isRiding", isRiding);
            currentBikeSpeed = 0f;
        }

        float currentGroundDistance = isRiding ? groundDistanceRide : groundDistanceWalk;
        isGrounded = Physics.CheckSphere(groundCheck.position, currentGroundDistance, groundMask);

        float moveInput = Input.GetAxisRaw("Horizontal");
        Vector3 velocity = rb.velocity;

        if (isRiding)
        {
            if (moveInput != 0)
            {
                currentBikeSpeed += acceleration * Time.deltaTime;
                currentBikeSpeed = Mathf.Clamp(currentBikeSpeed, 0f, maxBikeSpeed);
                velocity.x = moveInput * currentBikeSpeed;
            }
            else
            {
                currentBikeSpeed = Mathf.MoveTowards(currentBikeSpeed, 0f, deceleration * Time.deltaTime);
                velocity.x = Mathf.Sign(velocity.x) * currentBikeSpeed;
            }
        }
        else
        {
            velocity.x = moveInput * moveSpeed;
        }

        rb.velocity = velocity;

        if (!isRiding && Input.GetKeyDown(KeyCode.W) && isGrounded)
        {
            rb.velocity = new Vector3(rb.velocity.x, 0f, 0f);
            rb.AddForce(Vector3.up * jumpForce, ForceMode.Impulse);
        }

        if (rb.velocity.y < 0)
        {
            rb.velocity += Vector3.up * Physics.gravity.y * (fallMultiplier - 1) * Time.deltaTime;
        }
        else if (rb.velocity.y > 0 && !Input.GetKey(KeyCode.W))
        {
            rb.velocity += Vector3.up * Physics.gravity.y * (lowJumpMultiplier - 1) * Time.deltaTime;
        }

        // 翻转角色
        if (moveInput < 0 && !facingLeft)
        {
            Flip();
        }
        else if (moveInput > 0 && facingLeft)
        {
            Flip();
        }

        // 更新动画
        animator.SetFloat("Speed", Mathf.Abs(rb.velocity.x));
    }

    void Flip()
    {
        facingLeft = !facingLeft;

        // 翻转缩放
        Vector3 scale = transform.localScale;
        scale.x = Mathf.Abs(scale.x) * (facingLeft ? -1f : 1f);
        transform.localScale = scale;

        // 仅在翻转时移动偏移（不会反复抵消）
        float offset = flipOffset * 2f;
        transform.position += new Vector3(facingLeft ? -offset : offset, 0f, 0f);
    }


    public bool IsFacingLeft()
    {
        return facingLeft;
    }
}
