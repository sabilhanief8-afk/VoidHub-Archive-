/* VOIDHUB v4.0 - PREMIUM JS LOGIC 
    ENHANCED FOR 16x SPEED & 8x NOTIF 
    BYPASS LATENCY 300ms+
*/

const VOID_CONFIG = {
    script_url: "https://raw.githubusercontent.com/sabilhanief8-afk/VoidHub-Archive-/refs/heads/main/FishIt.lua",
    speed_mult: 16,
    notif_spam: 8
};

function copyScript() {
    const loadstring = `loadstring(game:HttpGet("${VOID_CONFIG.script_url}"))()`;
    
    navigator.clipboard.writeText(loadstring).then(() => {
        // Visual Feedback Gacor
        const statusText = document.querySelector('.status-text');
        const progressFill = document.querySelector('.progress-fill');
        
        if (statusText && progressFill) {
            statusText.innerText = "INJECTING VOIDHUB 16x SPEED...";
            statusText.style.color = "#2dd4bf";
            progressFill.style.width = "100%";
            
            setTimeout(() => {
                alert("🌌 KION! VoidHub Berhasil di-Copy!\n\nFitur Aktif:\n- 16x Speed Fishing\n- 8x Multi-Notif (Spam Loot)\n- 300ms Latency Bypass\n\nLangsung tempel di Delta lu!");
                statusText.innerText = "VOIDHUB ACTIVE - READY TO FISH";
            }, 800);
        }
    }).catch(err => {
        console.error('Kitsune Error:', err);
        alert("Gagal copy script. Coba cek izin browser lu, Kion!");
    });
}

// Logic untuk simulasi progress bar pas halaman dibuka (Biar kelihatan pro)
document.addEventListener('DOMContentLoaded', () => {
    const fill = document.querySelector('.progress-fill');
    const status = document.querySelector('.status-text');
    
    if (fill && status) {
        let width = 0;
        const interval = setInterval(() => {
            if (width >= 85) {
                clearInterval(interval);
                status.innerText = "System Ready: VoidHub v4.0 Detected";
            } else {
                width += Math.random() * 10;
                fill.style.width = width + '%';
                status.innerText = "Bypassing Server Latency (" + Math.floor(width) + "%)...";
            }
        }, 150);
    }
});

// Fitur Modal & Info Popup sesuai CSS lu
function showModal() {
    document.getElementById('myModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('myModal').style.display = 'none';
}

function toggleInfo() {
    const popup = document.getElementById('infoPopup');
    popup.style.display = popup.style.display === 'block' ? 'none' : 'block';
}
