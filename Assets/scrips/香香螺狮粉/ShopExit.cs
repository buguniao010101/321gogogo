using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;  // 引用 UI 组件

public class ShopExit : MonoBehaviour
{
    [SerializeField] private string targetSceneName = "街道";  // 你要切换到的目标场景名

    // Start方法只定义一次，不重复
    void Start()
    {
        Button exitButton = GetComponent<Button>();  // 获取Button组件

        // 检查Button是否存在
        if (exitButton != null)
        {
            exitButton.onClick.AddListener(OnButtonClick);  // 添加监听器
        }
        else
        {
            Debug.LogError("没有找到Button组件！");
        }
    }

    // 点击按钮时会调用这个方法
    public void OnButtonClick()
    {
        Debug.Log("返回街道场景！");
        SceneManager.LoadScene(targetSceneName);  // 加载场景
    }
}
