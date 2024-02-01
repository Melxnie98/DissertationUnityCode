using System.Collections;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class ExitControll : MonoBehaviour
{
    private float exitTime = 60f; // 30 seconds
    private bool exit = false;
    public Slider exitslide;

    private void Start()
    {
        StartCoroutine(ExitScene());
    }


   IEnumerator ExitScene()
    {
        while (!exit)
        {
            exitTime -= Time.deltaTime;
            exitslide.value = exitTime / 60f;

            if (exitTime <= 0f)
            {
                exit = true;

                Application.Quit();
                
                //Canvas.Destroy(canvas)
            }
            yield return null;

        }
        

    }

 }

