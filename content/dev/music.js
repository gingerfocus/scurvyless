let playlist;

// Fetch and Shuffle the playlist
(async function () {
    // No need to handle errors, I dont make mistakes
    const url = "/dev/music.json";
    const response = await fetch(url);
    playlist = await response.json();

    let i = playlist.length;
    while (--i > 0) {
        j = Math.floor(Math.random() * (i + 1));
        temp = playlist[j];
        playlist[j] = playlist[i];
        playlist[i] = temp;
    }
})();

// ffmpeg -y -i 01-sonora.ogg -c:a libopus -b:a 16k -vn -map_metadata -1 test2.ogg


const audio = document.getElementById("main-audio");

const toggBtn = document.getElementById("play-pause-btn");
const prevBtn = document.getElementById("prev-btn");
const nextBtn = document.getElementById("next-btn");
const copyBtn = document.getElementById("copy-btn");

let index = 0;

function playnext() {
    index++;
    if (index >= playlist.length) index = 0;
    loadsong();
}

// Your existing playRandom function from before...
function loadsong() {
    // yes this skips the first index, its randomized, who cares
    audio.src = playlist[index].song;
    audio.play();
}

// Toggle Play/Pause
toggBtn.addEventListener("click", () => {
    // If it's the first play, we might need to pick a song
    if (!audio.src) {
        loadsong();
        return;
    }

    if (audio.paused) {
        audio.play();
    } else {
        audio.pause();
    }
});

// Update UI when audio starts playing
audio.addEventListener("play", () => {
    toggBtn.innerText = "STOP";
});

// Update UI when audio pauses
audio.addEventListener("pause", () => {
    toggBtn.innerText = "PLAY";
});

nextBtn.addEventListener("click", playnext);
prevBtn.addEventListener("click", () => {
    index--;
    if (index < 0) index = playlist.length - 1;
    loadsong();
});
copyBtn.addEventListener("click", () => {
    navigator.clipboard.writeText(playlist[index].desc);
});

audio.addEventListener("ended", playnext);

barba.init({
    transitions: [
        {
            name: "fade",
            leave(data) {
                return new Promise((resolve) => {
                    data.current.container.style.opacity = 0;
                    setTimeout(resolve, 300);
                });
            },
            enter(data) {
                data.next.container.style.opacity = 0;
                setTimeout(() => {
                    data.next.container.style.opacity = 1;
                }, 10);
            },
        },
    ],
});

// prevents loading the same page
document.querySelectorAll("nav a").forEach((link) => {
    link.addEventListener("click", (e) => {
        if (link.href === window.location.href) {
            e.preventDefault(); // Stop the reload entirely
            console.log(
                "Already on this page, ignoring click to save the music.",
            );
        }
    });
});
