using UnityEngine;
using UnityEngine.SceneManagement;

public class ShopEntrance : MonoBehaviour
{
    private bool playerInZone = false;

    [SerializeField] private string targetSceneName = "香香螺狮粉";

    void Update()
    {
        if (playerInZone && Input.GetKeyDown(KeyCode.Space))
        {
            // 💾 进入店前，记录当前场景名（比如“街道”）
            GameManager.Instance.previousSceneName = SceneManager.GetActiveScene().name;

            Debug.Log("进入香香螺狮粉场景！");
            SceneManager.LoadScene(targetSceneName);
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            playerInZone = true;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            playerInZone = false;
        }
    }
}
