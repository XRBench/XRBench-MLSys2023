
Network HT_hand_graph_cnn_half {

FPS: 45

Layer conv1 { 
    Type: CONV
    Dimensions: { N: 1, K: 64, C: 3, Y: 128, X: 128, R: 7, S: 7 }
}

Layer conv2 { 
    Type: CONV
    Dimensions: { N: 1, K: 64, C: 64, Y: 64, X: 64, R: 1, S: 1 }
}

Layer conv3 { 
    Type: CONV
    Dimensions: { N: 1, K: 64, C: 64, Y: 64, X: 64, R: 3, S: 3 }
}

Layer conv4 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 64, Y: 64, X: 64, R: 1, S: 1 }
}

Layer conv5 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 64, Y: 64, X: 64, R: 1, S: 1 }
}

Layer conv6 { 
    Type: CONV
    Dimensions: { N: 1, K: 64, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv7 { 
    Type: CONV
    Dimensions: { N: 1, K: 64, C: 64, Y: 32, X: 32, R: 3, S: 3 }
}

Layer conv8 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 64, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv9 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv10 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 32, X: 32, R: 3, S: 3 }
}

Layer conv11 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv12 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv13 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv14 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 32, X: 32, R: 3, S: 3 }
}

Layer conv15 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv16 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv17 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 32, X: 32, R: 3, S: 3 }
}

Layer conv18 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv19 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv20 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv21 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv22 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv23 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv24 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv25 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv26 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv27 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv28 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv29 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv30 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv31 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv32 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv33 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv34 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv35 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv36 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv37 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv38 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv39 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv40 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv41 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv42 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv43 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv44 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv45 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv46 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv47 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv48 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv49 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv50 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv51 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv52 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv53 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv54 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv55 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv56 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 2, X: 2, R: 3, S: 3 }
}

Layer conv57 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv58 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv59 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 2, X: 2, R: 3, S: 3 }
}

Layer conv60 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv61 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv62 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 2, X: 2, R: 3, S: 3 }
}

Layer conv63 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv64 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv65 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 2, X: 2, R: 3, S: 3 }
}

Layer conv66 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv67 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv68 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 2, X: 2, R: 3, S: 3 }
}

Layer conv69 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv70 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv71 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 2, X: 2, R: 3, S: 3 }
}

Layer conv72 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv73 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv74 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv75 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv76 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv77 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv78 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv79 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv80 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv81 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv82 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv83 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv84 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv85 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv86 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv87 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv88 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv89 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv90 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv91 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv92 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 32, X: 32, R: 3, S: 3 }
}

Layer conv93 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv94 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv95 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 32, X: 32, R: 3, S: 3 }
}

Layer conv96 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv97 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv98 { 
    Type: CONV
    Dimensions: { N: 1, K: 21, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv99 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv100 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 21, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv101 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv102 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 32, X: 32, R: 3, S: 3 }
}

Layer conv103 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv104 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv105 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 32, X: 32, R: 3, S: 3 }
}

Layer conv106 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv107 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv108 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv109 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv110 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv111 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv112 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv113 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv114 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv115 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv116 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv117 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv118 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv119 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv120 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv121 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv122 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv123 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv124 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv125 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv126 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv127 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv128 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv129 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv130 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv131 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv132 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv133 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv134 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv135 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv136 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv137 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv138 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv139 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv140 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv141 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv142 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv143 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv144 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 2, X: 2, R: 3, S: 3 }
}

Layer conv145 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv146 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv147 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 2, X: 2, R: 3, S: 3 }
}

Layer conv148 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv149 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv150 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 2, X: 2, R: 3, S: 3 }
}

Layer conv151 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv152 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv153 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 2, X: 2, R: 3, S: 3 }
}

Layer conv154 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv155 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv156 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 2, X: 2, R: 3, S: 3 }
}

Layer conv157 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv158 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv159 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 2, X: 2, R: 3, S: 3 }
}

Layer conv160 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 2, X: 2, R: 1, S: 1 }
}

Layer conv161 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv162 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv163 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv164 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv165 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv166 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv167 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv168 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv169 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv170 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv171 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv172 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv173 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv174 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv175 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv176 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv177 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv178 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv179 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv180 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 32, X: 32, R: 3, S: 3 }
}

Layer conv181 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv182 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv183 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 32, X: 32, R: 3, S: 3 }
}

Layer conv184 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv185 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv186 { 
    Type: CONV
    Dimensions: { N: 1, K: 21, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv187 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 21, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv188 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv189 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv190 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 32, X: 32, R: 3, S: 3 }
}

Layer conv191 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv192 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv193 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 32, X: 32, R: 3, S: 3 }
}

Layer conv194 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 32, X: 32, R: 1, S: 1 }
}

Layer conv195 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv196 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv197 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv198 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv199 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 16, X: 16, R: 3, S: 3 }
}

Layer conv200 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 16, X: 16, R: 1, S: 1 }
}

Layer conv201 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv202 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv203 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv204 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv205 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 8, X: 8, R: 3, S: 3 }
}

Layer conv206 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 8, X: 8, R: 1, S: 1 }
}

Layer conv207 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv208 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv209 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv210 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 256, Y: 4, X: 4, R: 1, S: 1 }
}

Layer conv211 { 
    Type: CONV
    Dimensions: { N: 1, K: 128, C: 128, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv212 { 
    Type: CONV
    Dimensions: { N: 1, K: 256, C: 128, Y: 4, X: 4, R: 1, S: 1 }
}

Layer fc1 { 
    Type: CONV
    Dimensions: { N: 1, K: 512, C: 4096, Y: 1, X: 1, R: 1, S: 1 }
}

Layer fc2 { 
    Type: CONV
    Dimensions: { N: 1, K: 5120, C: 512, Y: 1, X: 1, R: 1, S: 1 }
}

Layer fc3 { 
    Type: CONV
    Dimensions: { N: 1, K: 64, C: 192, Y: 1, X: 1, R: 1, S: 1 }
}

Layer fc4 { 
    Type: CONV
    Dimensions: { N: 1, K: 32, C: 192, Y: 1, X: 1, R: 1, S: 1 }
}

Layer fc5 { 
    Type: CONV
    Dimensions: { N: 1, K: 32, C: 96, Y: 1, X: 1, R: 1, S: 1 }
}

Layer fc6 { 
    Type: CONV
    Dimensions: { N: 1, K: 3, C: 96, Y: 1, X: 1, R: 1, S: 1 }
}

Layer fc7 { 
    Type: CONV
    Dimensions: { N: 1, K: 32, C: 9, Y: 1, X: 1, R: 1, S: 1 }
}

Layer fc8 { 
    Type: CONV
    Dimensions: { N: 1, K: 32, C: 96, Y: 1, X: 1, R: 1, S: 1 }
}

Layer fc9 { 
    Type: CONV
    Dimensions: { N: 1, K: 64, C: 96, Y: 1, X: 1, R: 1, S: 1 }
}

Layer fc10 { 
    Type: CONV
    Dimensions: { N: 1, K: 64, C: 192, Y: 1, X: 1, R: 1, S: 1 }
}

Layer fc11 { 
    Type: CONV
    Dimensions: { N: 1, K: 512, C: 512, Y: 1, X: 1, R: 1, S: 1 }
}

Layer fc12 { 
    Type: CONV
    Dimensions: { N: 1, K: 20, C: 512, Y: 1, X: 1, R: 1, S: 1 }
}

}

Network DE_midas_v21_small {

FPS: 30

Layer conv1 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 96, X: 128, R: 3, S: 3 }
}

Layer conv2 { 
	Type: CONV
	Dimensions: { N: 1, K: 24, C: 32, Y: 96, X: 128, R: 1, S: 1 }
}

Layer conv3 { 
	Type: CONV
	Dimensions: { N: 1, K: 144, C: 24, Y: 96, X: 128, R: 1, S: 1 }
}

Layer conv4 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 144, Y: 48, X: 64, R: 1, S: 1 }
}

Layer conv5 { 
	Type: CONV
	Dimensions: { N: 1, K: 192, C: 32, Y: 48, X: 64, R: 1, S: 1 }
}

Layer conv6 { 
	Type: CONV
	Dimensions: { N: 1, K: 192, C: 192, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv7 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 192, Y: 48, X: 64, R: 1, S: 1 }
}

Layer conv8 { 
	Type: CONV
	Dimensions: { N: 1, K: 192, C: 32, Y: 48, X: 64, R: 1, S: 1 }
}

Layer conv9 { 
	Type: CONV
	Dimensions: { N: 1, K: 192, C: 192, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv10 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 192, Y: 48, X: 64, R: 1, S: 1 }
}

Layer conv11 { 
	Type: CONV
	Dimensions: { N: 1, K: 192, C: 32, Y: 48, X: 64, R: 1, S: 1 }
}

Layer conv12 { 
	Type: CONV
	Dimensions: { N: 1, K: 48, C: 192, Y: 24, X: 32, R: 1, S: 1 }
}

Layer conv13 { 
	Type: CONV
	Dimensions: { N: 1, K: 288, C: 48, Y: 24, X: 32, R: 1, S: 1 }
}

Layer conv14 { 
	Type: CONV
	Dimensions: { N: 1, K: 288, C: 288, Y: 24, X: 32, R: 5, S: 5 }
}

Layer conv15 { 
	Type: CONV
	Dimensions: { N: 1, K: 48, C: 288, Y: 24, X: 32, R: 1, S: 1 }
}

Layer conv16 { 
	Type: CONV
	Dimensions: { N: 1, K: 288, C: 48, Y: 24, X: 32, R: 1, S: 1 }
}

Layer conv17 { 
	Type: CONV
	Dimensions: { N: 1, K: 288, C: 288, Y: 24, X: 32, R: 5, S: 5 }
}

Layer conv18 { 
	Type: CONV
	Dimensions: { N: 1, K: 48, C: 288, Y: 24, X: 32, R: 1, S: 1 }
}

Layer conv19 { 
	Type: CONV
	Dimensions: { N: 1, K: 288, C: 48, Y: 24, X: 32, R: 1, S: 1 }
}

Layer conv20 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 288, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv21 { 
	Type: CONV
	Dimensions: { N: 1, K: 576, C: 96, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv22 { 
	Type: CONV
	Dimensions: { N: 1, K: 576, C: 576, Y: 12, X: 16, R: 3, S: 3 }
}

Layer conv23 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 576, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv24 { 
	Type: CONV
	Dimensions: { N: 1, K: 576, C: 96, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv25 { 
	Type: CONV
	Dimensions: { N: 1, K: 576, C: 576, Y: 12, X: 16, R: 3, S: 3 }
}

Layer conv26 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 576, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv27 { 
	Type: CONV
	Dimensions: { N: 1, K: 576, C: 96, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv28 { 
	Type: CONV
	Dimensions: { N: 1, K: 576, C: 576, Y: 12, X: 16, R: 3, S: 3 }
}

Layer conv29 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 576, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv30 { 
	Type: CONV
	Dimensions: { N: 1, K: 576, C: 96, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv31 { 
	Type: CONV
	Dimensions: { N: 1, K: 576, C: 576, Y: 12, X: 16, R: 3, S: 3 }
}

Layer conv32 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 576, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv33 { 
	Type: CONV
	Dimensions: { N: 1, K: 576, C: 96, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv34 { 
	Type: CONV
	Dimensions: { N: 1, K: 576, C: 576, Y: 12, X: 16, R: 5, S: 5 }
}

Layer conv35 { 
	Type: CONV
	Dimensions: { N: 1, K: 136, C: 576, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv36 { 
	Type: CONV
	Dimensions: { N: 1, K: 816, C: 136, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv37 { 
	Type: CONV
	Dimensions: { N: 1, K: 816, C: 816, Y: 12, X: 16, R: 5, S: 5 }
}

Layer conv38 { 
	Type: CONV
	Dimensions: { N: 1, K: 136, C: 816, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv39 { 
	Type: CONV
	Dimensions: { N: 1, K: 816, C: 136, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv40 { 
	Type: CONV
	Dimensions: { N: 1, K: 816, C: 816, Y: 12, X: 16, R: 5, S: 5 }
}

Layer conv41 { 
	Type: CONV
	Dimensions: { N: 1, K: 136, C: 816, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv42 { 
	Type: CONV
	Dimensions: { N: 1, K: 816, C: 136, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv43 { 
	Type: CONV
	Dimensions: { N: 1, K: 816, C: 816, Y: 12, X: 16, R: 5, S: 5 }
}

Layer conv44 { 
	Type: CONV
	Dimensions: { N: 1, K: 136, C: 816, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv45 { 
	Type: CONV
	Dimensions: { N: 1, K: 816, C: 136, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv46 { 
	Type: CONV
	Dimensions: { N: 1, K: 816, C: 816, Y: 12, X: 16, R: 5, S: 5 }
}

Layer conv47 { 
	Type: CONV
	Dimensions: { N: 1, K: 136, C: 816, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv48 { 
	Type: CONV
	Dimensions: { N: 1, K: 816, C: 136, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv49 { 
	Type: CONV
	Dimensions: { N: 1, K: 232, C: 816, Y: 6, X: 8, R: 1, S: 1 }
}

Layer conv50 { 
	Type: CONV
	Dimensions: { N: 1, K: 1392, C: 232, Y: 6, X: 8, R: 1, S: 1 }
}

Layer conv51 { 
	Type: CONV
	Dimensions: { N: 1, K: 1392, C: 1392, Y: 6, X: 8, R: 5, S: 5 }
}

Layer conv52 { 
	Type: CONV
	Dimensions: { N: 1, K: 232, C: 1392, Y: 6, X: 8, R: 1, S: 1 }
}

Layer conv53 { 
	Type: CONV
	Dimensions: { N: 1, K: 1392, C: 232, Y: 6, X: 8, R: 1, S: 1 }
}

Layer conv54 { 
	Type: CONV
	Dimensions: { N: 1, K: 1392, C: 1392, Y: 6, X: 8, R: 5, S: 5 }
}

Layer conv55 { 
	Type: CONV
	Dimensions: { N: 1, K: 232, C: 1392, Y: 6, X: 8, R: 1, S: 1 }
}

Layer conv56 { 
	Type: CONV
	Dimensions: { N: 1, K: 1392, C: 232, Y: 6, X: 8, R: 1, S: 1 }
}

Layer conv57 { 
	Type: CONV
	Dimensions: { N: 1, K: 1392, C: 1392, Y: 6, X: 8, R: 5, S: 5 }
}

Layer conv58 { 
	Type: CONV
	Dimensions: { N: 1, K: 232, C: 1392, Y: 6, X: 8, R: 1, S: 1 }
}

Layer conv59 { 
	Type: CONV
	Dimensions: { N: 1, K: 1392, C: 232, Y: 6, X: 8, R: 1, S: 1 }
}

Layer conv60 { 
	Type: CONV
	Dimensions: { N: 1, K: 1392, C: 1392, Y: 6, X: 8, R: 5, S: 5 }
}

Layer conv61 { 
	Type: CONV
	Dimensions: { N: 1, K: 232, C: 1392, Y: 6, X: 8, R: 1, S: 1 }
}

Layer conv62 { 
	Type: CONV
	Dimensions: { N: 1, K: 1392, C: 232, Y: 6, X: 8, R: 1, S: 1 }
}

Layer conv63 { 
	Type: CONV
	Dimensions: { N: 1, K: 1392, C: 1392, Y: 6, X: 8, R: 5, S: 5 }
}

Layer conv64 { 
	Type: CONV
	Dimensions: { N: 1, K: 232, C: 1392, Y: 6, X: 8, R: 1, S: 1 }
}

Layer conv65 { 
	Type: CONV
	Dimensions: { N: 1, K: 1392, C: 232, Y: 6, X: 8, R: 1, S: 1 }
}

Layer conv66 { 
	Type: CONV
	Dimensions: { N: 1, K: 1392, C: 1392, Y: 6, X: 8, R: 3, S: 3 }
}

Layer conv67 { 
	Type: CONV
	Dimensions: { N: 1, K: 384, C: 1392, Y: 6, X: 8, R: 1, S: 1 }
}

Layer conv68 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 32, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv69 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 48, Y: 24, X: 32, R: 3, S: 3 }
}

Layer conv70 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 136, Y: 12, X: 16, R: 3, S: 3 }
}

Layer conv71 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 384, Y: 6, X: 8, R: 3, S: 3 }
}

Layer conv72 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 6, X: 8, R: 3, S: 3 }
}

Layer conv73 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 6, X: 8, R: 3, S: 3 }
}

Layer conv74 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 512, Y: 12, X: 16, R: 1, S: 1 }
}

Layer conv75 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 12, X: 16, R: 3, S: 3 }
}

Layer conv76 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 12, X: 16, R: 3, S: 3 }
}

Layer conv77 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 12, X: 16, R: 3, S: 3 }
}

Layer conv78 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 12, X: 16, R: 3, S: 3 }
}

Layer conv79 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 256, Y: 24, X: 32, R: 1, S: 1 }
}

Layer conv80 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 24, X: 32, R: 3, S: 3 }
}

Layer conv81 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 24, X: 32, R: 3, S: 3 }
}

Layer conv82 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 24, X: 32, R: 3, S: 3 }
}

Layer conv83 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 24, X: 32, R: 3, S: 3 }
}

Layer conv84 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 128, Y: 48, X: 64, R: 1, S: 1 }
}

Layer conv85 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv86 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv87 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv88 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv89 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 96, X: 128, R: 1, S: 1 }
}

Layer conv90 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 64, Y: 96, X: 128, R: 3, S: 3 }
}

Layer conv91 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 192, X: 256, R: 3, S: 3 }
}

Layer conv92 { 
	Type: CONV
	Dimensions: { N: 1, K: 1, C: 32, Y: 192, X: 256, R: 1, S: 1 }
}

}


Network PD_Plane_RCNN_Quarter {

FPS: 15

Layer conv1 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 3, Y: 160, X: 160, R: 7, S: 7 }
}

Layer conv2 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 40, X: 40, R: 1, S: 1 }
}

Layer conv3 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 40, X: 40, R: 3, S: 3 }
}

Layer conv4 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 40, X: 40, R: 1, S: 1 }
}

Layer conv5 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 40, X: 40, R: 1, S: 1 }
}

Layer conv6 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 256, Y: 40, X: 40, R: 1, S: 1 }
}

Layer conv7 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 40, X: 40, R: 3, S: 3 }
}

Layer conv8 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 40, X: 40, R: 1, S: 1 }
}

Layer conv9 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 256, Y: 40, X: 40, R: 1, S: 1 }
}

Layer conv10 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 40, X: 40, R: 3, S: 3 }
}

Layer conv11 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 40, X: 40, R: 1, S: 1 }
}

Layer conv12 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 256, Y: 40, X: 40, R: 1, S: 1 }
}

Layer conv13 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 40, X: 40, R: 3, S: 3 }
}

Layer conv14 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 20, X: 20, R: 1, S: 1 }
}

Layer conv15 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 256, Y: 40, X: 40, R: 1, S: 1 }
}

Layer conv16 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 20, X: 20, R: 1, S: 1 }
}

Layer conv17 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 20, X: 20, R: 3, S: 3 }
}

Layer conv18 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 20, X: 20, R: 1, S: 1 }
}

Layer conv19 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 20, X: 20, R: 1, S: 1 }
}

Layer conv20 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 20, X: 20, R: 3, S: 3 }
}

Layer conv21 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 20, X: 20, R: 1, S: 1 }
}

Layer conv22 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 20, X: 20, R: 1, S: 1 }
}

Layer conv23 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 20, X: 20, R: 3, S: 3 }
}

Layer conv24 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 20, X: 20, R: 1, S: 1 }
}

Layer conv25 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 512, Y: 20, X: 20, R: 1, S: 1 }
}

Layer conv26 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv27 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv28 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 20, X: 20, R: 1, S: 1 }
}

Layer conv29 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv30 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv31 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv32 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv33 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv34 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv35 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv36 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv37 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv38 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv39 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv40 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv41 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv42 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv43 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv44 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv45 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv46 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv47 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv48 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv49 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv50 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv51 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv52 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv53 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv54 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv55 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv56 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv57 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv58 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv59 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv60 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv61 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv62 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv63 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv64 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv65 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv66 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv67 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv68 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv69 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv70 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv71 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv72 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv73 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv74 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv75 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv76 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv77 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv78 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv79 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv80 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv81 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv82 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv83 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv84 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv85 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv86 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv87 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv88 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv89 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv90 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv91 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv92 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv93 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv94 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv95 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv96 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 5, X: 5, R: 3, S: 3 }
}

Layer conv97 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 5, X: 5, R: 1, S: 1 }
}

Layer conv98 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv99 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 5, X: 5, R: 1, S: 1 }
}

Layer conv100 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 5, X: 5, R: 3, S: 3 }
}

Layer conv101 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 5, X: 5, R: 1, S: 1 }
}

Layer conv102 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 5, X: 5, R: 1, S: 1 }
}

Layer conv103 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 5, X: 5, R: 3, S: 3 }
}

Layer conv104 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 5, X: 5, R: 1, S: 1 }
}

Layer conv105 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 2048, Y: 5, X: 5, R: 1, S: 1 }
}

Layer conv106 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 10, X: 10, R: 1, S: 1 }
}

Layer conv107 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 512, Y: 20, X: 20, R: 1, S: 1 }
}

Layer conv108 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 40, X: 40, R: 1, S: 1 }
}

Layer conv109 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 5, X: 5, R: 3, S: 3 }
}

Layer conv110 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv111 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 20, X: 20, R: 3, S: 3 }
}

Layer conv112 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 40, X: 40, R: 3, S: 3 }
}

Layer conv113 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 256, Y: 3, X: 3, R: 3, S: 3 }
}

Layer conv114 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 5, X: 5, R: 3, S: 3 }
}

Layer conv115 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 256, Y: 5, X: 5, R: 3, S: 3 }
}

Layer conv116 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 256, Y: 10, X: 10, R: 3, S: 3 }
}

Layer conv117 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 256, Y: 8, X: 10, R: 3, S: 3 }
}

Layer conv118 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 256, Y: 15, X: 30, R: 3, S: 3 }
}

Layer conv119 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 256, Y: 15, X: 30, R: 3, S: 3 }
}

Layer conv120 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 256, Y: 30, X: 40, R: 3, S: 3 }
}

Layer conv121 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 256, Y: 30, X: 40, R: 3, S: 3 }
}

Layer conv122 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 256, Y: 60, X: 80, R: 3, S: 3 }
}

Layer conv123 { 
	Type: CONV
	Dimensions: { N: 1, K: 1, C: 64, Y: 60, X: 80, R: 3, S: 3 }
}

Layer conv124 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 3, Y: 40, X: 40, R: 1, S: 1 }
}

Layer conv125 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 256, Y: 3, X: 3, R: 3, S: 3 }
}

Layer conv126 { 
	Type: CONV
	Dimensions: { N: 1, K: 6, C: 512, Y: 3, X: 3, R: 1, S: 1 }
}

Layer conv127 { 
	Type: CONV
	Dimensions: { N: 1, K: 12, C: 512, Y: 3, X: 3, R: 1, S: 1 }
}

Layer conv128 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 320, Y: 2, X: 2, R: 4, S: 4 }
}

Layer conv129 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 1024, Y: 1, X: 1, R: 1, S: 1 }
}

Layer fc1 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 1024, Y: 1024, X: 1, R: 1, S: 1 }
}

Layer fc2 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 1024, Y: 1024, X: 1, R: 1, S: 1 }
}

Layer fc3 { 
	Type: CONV
	Dimensions: { N: 1, K: 24, C: 1024, Y: 1024, X: 1, R: 1, S: 1 }
}

Layer conv130 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv131 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv132 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv133 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 4, X: 4, R: 3, S: 3 }
}

Layer conv134 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 3, X: 3, R: 2, S: 2 }
}

Layer conv135 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 256, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv136 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 10, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv137 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv138 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 128, Y: 24, X: 32, R: 3, S: 3 }
}

Layer conv139 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 24, X: 32, R: 3, S: 3 }
}

Layer conv140 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 256, Y: 12, X: 16, R: 3, S: 3 }
}

Layer conv141 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 128, Y: 12, X: 16, R: 4, S: 4 }
}

Layer conv142 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 128, Y: 24, X: 32, R: 4, S: 4 }
}

Layer conv143 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 64, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv144 { 
	Type: CONV
	Dimensions: { N: 1, K: 1, C: 16, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv145 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 128, Y: 12, X: 16, R: 4, S: 4 }
}

Layer conv146 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 128, Y: 24, X: 32, R: 4, S: 4 }
}

Layer conv147 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 64, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv148 { 
	Type: CONV
	Dimensions: { N: 1, K: 1, C: 16, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv149 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 64, Y: 48, X: 64, R: 3, S: 3 }
}

Layer conv150 { 
	Type: CONV
	Dimensions: { N: 1, K: 1, C: 16, Y: 48, X: 64, R: 3, S: 3 }
}

}