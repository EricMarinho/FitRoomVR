using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Video;

public class VideoChoseHandler : MonoBehaviour
{
    private VideoPlayer videoPlayer;

    [SerializeField] private List<VideoClip> playlistVideoClips = new();

    private void Start()
    {
        videoPlayer = GetComponent<VideoPlayer>();
    }

    public void PlayVideo(VideoClip videoClip)
    {
        videoPlayer.clip = videoClip;

        videoPlayer.Play();
    }

    public void PlayPlaylist()
    {
        int i = 0;
        videoPlayer.clip = playlistVideoClips[i];
        videoPlayer.Play();
        videoPlayer.loopPointReached += source =>
        {
            i++;
            if (i < playlistVideoClips.Count)
            {
                videoPlayer.clip = playlistVideoClips[i];
                videoPlayer.Play();
            }
            else
            {
                i = 0;
                videoPlayer.clip = playlistVideoClips[i];
                videoPlayer.Play();
            }
        };
    }
}
