using UnityEngine;

[System.Serializable]
public class SpawnPoint
{
    public string sceneName; // 场景名称
    public Vector3 spawnPosition; // 对应的出生位置

    public SpawnPoint(string name, Vector3 position)
    {
        sceneName = name;
        spawnPosition = position;
    }
}
