using System.Diagnostics;
using UnityEngine;
using UnityEngine.Video;


[DebuggerDisplay("{" + nameof(GetDebuggerDisplay) + "(),nq}")]
public class SyncInputs : MonoBehaviour
{
    public VideoPlayer videoPlayer;
    public AudioSource audioSource;


    private bool isPlaying = false;


    private void Start()
    {
        // Hook up the event to synchronize playback
        videoPlayer.loopPointReached += OnVideoLoopPointReached;
    }


    private void Update()
    {
        if (isPlaying)
        {
            // Synchronize video and audio time
            videoPlayer.time = audioSource.time;
        }
    }


    public void PlayVideoAndAudio()
    {
        videoPlayer.Play();
        audioSource.Play();
        isPlaying = true;
    }


    public void PauseVideoAndAudio()
    {
        videoPlayer.Pause();
        audioSource.Pause();
        isPlaying = false;
    }


    public void StopVideoAndAudio()
    {
        videoPlayer.Stop();
        audioSource.Stop();
        isPlaying = false;
    }


    private void OnVideoLoopPointReached(VideoPlayer source) =>
    // Synchronize playback when the video loop point is reached
    audioSource.time = (float)source.time;


    private string GetDebuggerDisplay()
    {
        return ToString();
    }
}
