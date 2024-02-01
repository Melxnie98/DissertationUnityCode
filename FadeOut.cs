using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.XR;

public class FadeOut : MonoBehaviour
{
   
    public XRNode controllerNode = XRNode.RightHand;

    // Update is called once per frame
    void Update()
    {

        //check if primary buttin is pressed, if so load exit scene and set active
        if (InputDevices.GetDeviceAtXRNode(controllerNode).TryGetFeatureValue(CommonUsages.primaryButton, out bool primaryButtonPressed) && primaryButtonPressed)
        {
            SceneManager.LoadScene("ExitScene", LoadSceneMode.Single);
            SceneManager.SetActiveScene(SceneManager.GetSceneByName("ExitScene"));
            SceneManager.UnloadSceneAsync("MainScene");

        }

    }
 

    
}
