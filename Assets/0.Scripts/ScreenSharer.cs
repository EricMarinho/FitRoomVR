using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScreenSharer : MonoBehaviour
{
    public MeshRenderer screenMaterial;

    private void Update()
    {
        CaptureScreen();
    }

    void CaptureScreen()
    {
        // Capture the screen and apply it to the material's texture
        Texture2D screenTexture = CaptureScreenToTexture();
        screenMaterial.material.SetTexture("New Render Texture", screenTexture);
    }

    Texture2D CaptureScreenToTexture()
    {
        // Capture the screen
        Rect screenRect = new Rect(0, 0, Screen.width, Screen.height);
        Texture2D screenTexture = new Texture2D(Screen.width, Screen.height, TextureFormat.RGB24, false);
        screenTexture.ReadPixels(screenRect, 0, 0);
        screenTexture.Apply();

        return screenTexture;
    }
}
