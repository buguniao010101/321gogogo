using UnityEngine;
using UnityEngine.EventSystems;

public class HoverAnimationTrigger : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler
{
    private Animator animator;

    void Awake()
    {
        animator = GetComponent<Animator>();
    }

    public void OnPointerEnter(PointerEventData eventData)
    {
        animator.SetBool("IsHover", true);
    }

    public void OnPointerExit(PointerEventData eventData)
    {
        animator.SetBool("IsHover", false);
    }
}
