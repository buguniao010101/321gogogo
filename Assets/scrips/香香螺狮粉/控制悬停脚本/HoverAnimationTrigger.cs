using UnityEngine;

public class HoverAnimationTrigger : MonoBehaviour
{
    private Animator animator;

    void Awake()
    {
        animator = GetComponent<Animator>();
    }

    void OnMouseEnter()
    {
        animator.SetBool("IsHover", true);
    }

    void OnMouseExit()
    {
        animator.SetBool("IsHover", false);
    }
}
