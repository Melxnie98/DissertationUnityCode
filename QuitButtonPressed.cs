using UnityEngine;
using UnityEngine.XR;
using UnityEngine.InputSystem.Users;
using UnityEngine.UI;
using System.Collections;
using UnityEngine.Video;

public class QuitButtonPressed : MonoBehaviour
{
    // The XR controller assigned to quit in inspector
    public XRNode controllerNode = XRNode.RightHand;
    public float fadeTime = 5.0f;
    public float quitTime = 6.0f;
    public VideoSource video;

    public AudioSource audioSource;
    public Image exitimage;
    public Color transparent = new Color(0, 0, 0, 0);

    public Color black = new Color(0, 0, 0, 1);


    void Update()
    {
        exitimage.color = transparent;
        // Check controller main button pressed
        if (InputDevices.GetDeviceAtXRNode(controllerNode).TryGetFeatureValue(CommonUsages.primaryButton, out bool primaryButtonPressed) && primaryButtonPressed)
        {
            StartCoroutine(CameraFadeToBlack());
            // Quit the application
            
        }
    }
    IEnumerator CameraFadeToBlack()
    {
        exitimage.color = transparent;


        float t = 0;


        while (t < fadeTime)
        {
            t += Time.deltaTime;

            Color newColor = Color.Lerp(transparent, black, t / fadeTime);
            exitimage.color = newColor;
            yield return null;
        }


        exitimage.color = black;
        t = fadeTime;


        while (t < quitTime)
        {
            t += Time.deltaTime;

            yield return null;
        }


        Application.Quit();


    }
}
