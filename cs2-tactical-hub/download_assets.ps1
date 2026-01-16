$weapons = @{
    "ak47.png"         = "https://www.csgodatabase.com/images/weapons/AK-47.png"
    "m4a1s.png"        = "https://www.csgodatabase.com/images/weapons/M4A1-S.png"
    "m4a4.png"         = "https://www.csgodatabase.com/images/weapons/M4A4.png"
    "aug.png"          = "https://www.csgodatabase.com/images/weapons/AUG.png"
    "famas.png"        = "https://www.csgodatabase.com/images/weapons/FAMAS.png"
    "awp.png"          = "https://www.csgodatabase.com/images/weapons/AWP.png"
    "ssg08.png"        = "https://www.csgodatabase.com/images/weapons/SSG_08.png"
    "g3sg1.png"        = "https://www.csgodatabase.com/images/weapons/G3SG1.png"
    "scar20.png"       = "https://www.csgodatabase.com/images/weapons/SCAR-20.png"
    "deagle.png"       = "https://www.csgodatabase.com/images/weapons/Desert_Eagle.png"
    "mp9.png"          = "https://www.csgodatabase.com/images/weapons/MP9.png"
    "zeus.png"         = "https://www.csgodatabase.com/images/weapons/Zeus_x27.png"
    "usp.png"          = "https://www.csgodatabase.com/images/weapons/USP-S.png"
    "p2000.png"        = "https://www.csgodatabase.com/images/weapons/P2000.png"
    "glock.png"        = "https://www.csgodatabase.com/images/weapons/Glock-18.png"
    "p250.png"         = "https://www.csgodatabase.com/images/weapons/P250.png"
    "fiveseven.png"    = "https://www.csgodatabase.com/images/weapons/Five-SeveN.png"
    "tec9.png"         = "https://www.csgodatabase.com/images/weapons/Tec-9.png"
    "cz75.png"         = "https://www.csgodatabase.com/images/weapons/CZ75-Auto.png"
    "dualberettas.png" = "https://www.csgodatabase.com/images/weapons/Dual_Berettas.png"
    "r8.png"           = "https://www.csgodatabase.com/images/weapons/R8_Revolver.png"
    "defuse.png"       = "https://liquipedia.net/commons/images/8/8d/Defuserhud_csgo.png"
    "galilar.png"      = "https://www.csgodatabase.com/images/weapons/Galil_AR.png"
    "sg553.png"        = "https://www.csgodatabase.com/images/weapons/SG_553.png"
    "mac10.png"        = "https://www.csgodatabase.com/images/weapons/MAC-10.png"
    "mp7.png"          = "https://www.csgodatabase.com/images/weapons/MP7.png"
    "ump45.png"        = "https://www.csgodatabase.com/images/weapons/UMP-45.png"
    "p90.png"          = "https://www.csgodatabase.com/images/weapons/P90.png"
    "ppbizon.png"      = "https://www.csgodatabase.com/images/weapons/PP-Bizon.png"
    "mp5sd.png"        = "https://www.csgodatabase.com/images/weapons/MP5-SD.png"
}

$maps = @{
    "mirage.png"   = "https://liquipedia.net/commons/images/thumb/f/f1/CS2_de_mirage.png/600px-CS2_de_mirage.png"
    "inferno.png"  = "https://liquipedia.net/commons/images/thumb/0/08/CS2_de_inferno.png/600px-CS2_de_inferno.png"
    "nuke.png"     = "https://liquipedia.net/commons/images/thumb/a/ad/CS2_de_nuke.png/600px-CS2_de_nuke.png"
    "overpass.png" = "https://liquipedia.net/commons/images/thumb/3/3c/CS2_de_overpass.png/600px-CS2_de_overpass.png"
    "ancient.png"  = "https://liquipedia.net/commons/images/thumb/f/fc/CS2_de_ancient.png/600px-CS2_de_ancient.png"
    "anubis.png"   = "https://liquipedia.net/commons/images/thumb/2/28/CS2_de_anubis.png/600px-CS2_de_anubis.png"
    "dust2.png"    = "https://liquipedia.net/commons/images/thumb/d/d7/CS2_Dust_2_A_Site.jpg/600px-CS2_Dust_2_A_Site.jpg"
    "train.png"    = "https://liquipedia.net/commons/images/thumb/4/44/CS2_de_train.png/600px-CS2_de_train.png"
    "vertigo.png"  = "https://liquipedia.net/commons/images/thumb/4/48/CS2_de_vertigo.png/600px-CS2_de_vertigo.png"
}

$dest = "f:\python\WEBY\cs2-tactical-hub\assets\images"

Write-Host "Downloading Weapons..."
foreach ($key in $weapons.Keys) {
    $url = $weapons[$key]
    $path = Join-Path $dest $key
    Write-Host "Downloading $key from $url"
    try {
        Invoke-WebRequest -Uri $url -OutFile $path -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
    }
    catch {
        Write-Error "Failed to download ${key}: $_"
    }
}

Write-Host "Downloading Maps..."
foreach ($key in $maps.Keys) {
    $url = $maps[$key]
    $path = Join-Path $dest $key
    Write-Host "Downloading $key from $url"
    try {
        Invoke-WebRequest -Uri $url -OutFile $path -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
    }
    catch {
        Write-Error "Failed to download ${key}: $_"
    }
}
