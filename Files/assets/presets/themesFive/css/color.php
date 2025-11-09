
<?php
header("Content-Type:text/css");

function checkhexcolor($color){
    return preg_match('/^#[a-f0-9]{6}$/i', $color);
}

// Check if colors are provided in the URL
if (isset($_GET['color1']) && $_GET['color1'] != '' && isset($_GET['color2']) && $_GET['color2'] != '') {
    $color1 = "#" . $_GET['color1'];
    $color2 = "#" . $_GET['color2'];
}

// Function to convert hex to RGB
function hex2rgb($hex) {
    $hex = str_replace("#", "", $hex);
 
    if(strlen($hex) == 3) {
       $r = hexdec(substr($hex,0,1).substr($hex,0,1));
       $g = hexdec(substr($hex,1,1).substr($hex,1,1));
       $b = hexdec(substr($hex,2,1).substr($hex,2,1));
    } else {
       $r = hexdec(substr($hex,0,2));
       $g = hexdec(substr($hex,2,2));
       $b = hexdec(substr($hex,4,2));
    }
    $rgb = array($r, $g, $b);
    return $rgb;
}

// Function to convert RGB to HSL
function rgb2hsl($r, $g, $b) {
    $r /= 255;
    $g /= 255;
    $b /= 255;
    $max = max($r, $g, $b);
    $min = min($r, $g, $b);
    $h;
    $s;
    $l = ($max + $min) / 2;
    $d = $max - $min;
    if($d == 0) {
       $h = $s = 0;
    } else {
       $s = $d / (1 - abs(2 * $l - 1));
       switch($max) {
          case $r:
             $h = 60 * fmod((($g - $b) / $d), 6);
             if ($b > $g) {
               $h += 360;
             }
             break;
          case $g:
             $h = 60 * (($b - $r) / $d + 2);
             break;
          case $b:
             $h = 60 * (($r - $g) / $d + 4);
             break;
       }
    }
    return array(round($h, 0), round($s*100, 0), round($l*100, 0));
}

// Convert colors to HSL
$rgb1 = hex2rgb($color1);
$hsl1 = rgb2hsl($rgb1[0], $rgb1[1], $rgb1[2]);

$rgb2 = hex2rgb($color2);
$hsl2 = rgb2hsl($rgb2[0], $rgb2[1], $rgb2[2]);
?>

/* Set CSS variables */
:root {
    --base-h: <?php echo $hsl1[0]; ?>;
    --base-s: <?php echo $hsl1[1].'%'; ?>;
    --base-l: <?php echo $hsl1[2].'%'; ?>;
    
    --base-two-h: <?php echo $hsl2[0]; ?>;
    --base-two-s: <?php echo $hsl2[1].'%'; ?>;
    --base-two-l: <?php echo $hsl2[2].'%'; ?>;
}
