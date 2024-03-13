using UnityEngine;

public class AutoCar : MonoBehaviour
{
    public float moveSpeed = 5f; // Speed of the car
    public float turnSpeed = 90f; // Speed of turning
    public float moveDistance = 10f; // Distance before turning

    private bool hasTurned = false; // Flag to track if the car has turned

    void Update()
    {
        // Move the car in the forward direction
        transform.Translate(Vector3.forward * moveSpeed * Time.deltaTime);

        // Check if the car has moved the specified distance and hasn't turned yet
        if (transform.position.z >= moveDistance && !hasTurned)
        {
            // Rotate the car to the right for a U-turn
            transform.Rotate(Vector3.up, 180f); // Rotate by 180 degrees

            // Set the flag to indicate the car has turned
            hasTurned = true;
        }
    }
}
