using UnityEngine;

public class Spawner : MonoBehaviour
{
    [SerializeField] GameObject _prefab;
    [SerializeField] int _spawnCount = 10;
    [SerializeField] Mesh _targetMesh;

    void Start()
    {
        var vertices = _targetMesh.vertices;

        for (var i = 0; i < _spawnCount; i++)
        {
            var anchor = vertices[Random.Range(0, vertices.Length)];
            var pos = anchor + Random.onUnitSphere;
            var go = Instantiate(_prefab, pos, Quaternion.identity);
            go.GetComponent<SpringJoint>().connectedAnchor = anchor;
            go.GetComponent<Renderer>().material.color = Color.HSVToRGB(Random.value, 0.6f, 1);
        }
    }
}
