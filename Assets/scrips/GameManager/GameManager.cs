using UnityEngine;
using System.Collections.Generic;

public class GameManager : MonoBehaviour
{
    public static GameManager Instance { get; private set; }

    // 用来保存每个场景的出生位置
    [SerializeField]
    private List<SpawnPoint> spawnPoints = new List<SpawnPoint>(); // 可编辑的出生点列表

    public string previousSceneName;

    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject); // 防止场景切换时销毁
        }
        else
        {
            Destroy(gameObject);
        }
    }

    // 根据场景名获取出生位置
    public Vector3 GetSpawnPointForScene(string sceneName)
    {
        foreach (var spawnPoint in spawnPoints)
        {
            if (spawnPoint.sceneName == sceneName)
            {
                return spawnPoint.spawnPosition;
            }
        }
        return Vector3.zero; // 默认返回零
    }

    // 设置某个场景的出生位置
    public void SetSpawnPointForScene(string sceneName, Vector3 spawnPoint)
    {
        foreach (var point in spawnPoints)
        {
            if (point.sceneName == sceneName)
            {
                point.spawnPosition = spawnPoint;
                return;
            }
        }
        spawnPoints.Add(new SpawnPoint(sceneName, spawnPoint)); // 如果没有找到该场景，新增一个出生点
    }
}
