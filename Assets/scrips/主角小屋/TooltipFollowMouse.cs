using UnityEngine;

public class TooltipFollowMouse : MonoBehaviour
{
    public Vector3 offset = new Vector3(0.5f, -0.5f, 0); // 偏移值，你可以调整

    void Update()
    {
        Vector3 mouseScreenPos = Input.mousePosition;
        mouseScreenPos.z = Camera.main.nearClipPlane; // 距离相机的深度，防止 Z=0 时看不见

        Vector3 mouseWorldPos = Camera.main.ScreenToWorldPoint(mouseScreenPos);
        transform.position = mouseWorldPos + offset;
    }
}
