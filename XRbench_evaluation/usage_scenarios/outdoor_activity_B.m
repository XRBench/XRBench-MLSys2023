Network KD_res8_narrow {

FPS:3

Layer conv1 { 
	Type: CONV
	Dimensions: { N: 1, K: 19, C: 1, Y: 98, X: 40, R: 3, S: 3 }
}

Layer conv2 { 
	Type: CONV
	Dimensions: { N: 1, K: 19, C: 19, Y: 24, X: 13, R: 3, S: 3 }
}

Layer conv3 { 
	Type: CONV
	Dimensions: { N: 1, K: 19, C: 19, Y: 24, X: 13, R: 3, S: 3 }
}

Layer conv4 { 
	Type: CONV
	Dimensions: { N: 1, K: 19, C: 19, Y: 24, X: 13, R: 3, S: 3 }
}

Layer conv5 { 
	Type: CONV
	Dimensions: { N: 1, K: 19, C: 19, Y: 24, X: 13, R: 3, S: 3 }
}

Layer conv6 { 
	Type: CONV
	Dimensions: { N: 1, K: 19, C: 19, Y: 24, X: 13, R: 3, S: 3 }
}

Layer conv7 { 
	Type: CONV
	Dimensions: { N: 1, K: 19, C: 19, Y: 24, X: 13, R: 3, S: 3 }
}

Layer fc1 { 
	Type: CONV
	Dimensions: { N: 1, K: 12, C: 19, Y: 19, X: 1, R: 1, S: 1 }
}

}

Network ASR_EM_24L {

FPS: 3
Probability: 0.2
Dependency: {
	KD_res8_narrow
}


Layer fc1 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc2 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc3 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc4 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc5 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc6 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc7 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc8 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc9 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc10 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc11 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc12 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc13 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc14 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc15 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc16 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc17 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc18 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc19 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc20 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc21 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc22 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc23 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc24 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc25 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc26 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc27 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc28 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc29 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc30 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc31 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc32 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc33 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc34 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc35 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc36 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc37 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc38 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc39 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc40 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc41 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc42 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc43 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc44 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc45 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc46 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc47 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc48 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc49 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc50 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc51 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc52 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc53 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc54 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc55 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc56 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc57 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc58 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc59 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc60 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc61 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc62 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc63 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc64 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc65 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc66 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc67 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc68 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc69 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc70 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc71 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc72 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc73 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc74 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc75 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc76 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc77 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc78 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc79 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc80 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc81 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc82 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc83 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc84 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc85 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc86 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc87 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc88 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc89 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc90 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc91 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc92 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc93 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc94 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc95 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc96 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc97 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc98 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc99 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc100 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc101 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc102 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc103 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc104 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc105 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc106 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc107 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc108 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc109 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc110 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc111 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc112 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc113 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc114 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc115 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc116 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc117 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc118 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc119 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 512, Y: 128, X: 1, R: 1, S: 1 }
}

Layer fc120 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 2048, Y: 128, X: 1, R: 1, S: 1 }
}

}


Network D2go_FastRCNN {

FPS: 30

Layer conv1 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 3, Y: 224, X: 299, R: 3, S: 3 }
}

Layer conv2 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 112, X: 150, R: 3, S: 3 }
}

Layer conv3 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 112, X: 150, R: 1, S: 1 }
}

Layer conv4 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 112, X: 150, R: 3, S: 3 }
}

Layer conv5 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 112, X: 150, R: 1, S: 1 }
}

Layer conv6 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 16, Y: 112, X: 150, R: 1, S: 1 }
}

Layer conv7 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 112, X: 150, R: 5, S: 5 }
}

Layer conv8 { 
	Type: CONV
	Dimensions: { N: 1, K: 24, C: 64, Y: 56, X: 75, R: 1, S: 1 }
}

Layer conv9 { 
	Type: CONV
	Dimensions: { N: 1, K: 72, C: 24, Y: 56, X: 75, R: 1, S: 1 }
}

Layer conv10 { 
	Type: CONV
	Dimensions: { N: 1, K: 72, C: 72, Y: 56, X: 75, R: 5, S: 5 }
}

Layer conv11 { 
	Type: CONV
	Dimensions: { N: 1, K: 24, C: 72, Y: 56, X: 75, R: 1, S: 1 }
}

Layer conv12 { 
	Type: CONV
	Dimensions: { N: 1, K: 72, C: 24, Y: 56, X: 75, R: 1, S: 1 }
}

Layer conv13 { 
	Type: CONV
	Dimensions: { N: 1, K: 72, C: 72, Y: 56, X: 75, R: 5, S: 5 }
}

Layer conv14 { 
	Type: CONV
	Dimensions: { N: 1, K: 24, C: 72, Y: 56, X: 75, R: 1, S: 1 }
}

Layer conv15 { 
	Type: CONV
	Dimensions: { N: 1, K: 72, C: 24, Y: 56, X: 75, R: 1, S: 1 }
}

Layer conv16 { 
	Type: CONV
	Dimensions: { N: 1, K: 72, C: 72, Y: 56, X: 75, R: 5, S: 5 }
}

Layer conv17 { 
	Type: CONV
	Dimensions: { N: 1, K: 24, C: 72, Y: 56, X: 75, R: 1, S: 1 }
}

Layer conv18 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 24, Y: 56, X: 75, R: 1, S: 1 }
}

Layer conv19 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 96, Y: 56, X: 75, R: 5, S: 5 }
}

Layer conv20 { 
	Type: CONV
	Dimensions: { N: 1, K: 24, C: 96, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv21 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 24, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv22 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 96, Y: 28, X: 38, R: 1, S: 1 }
}

Layer conv23 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 32, Y: 28, X: 38, R: 1, S: 1 }
}

Layer conv24 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 96, Y: 28, X: 38, R: 3, S: 3 }
}

Layer conv25 { 
	Type: CONV
	Dimensions: { N: 1, K: 24, C: 96, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv26 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 24, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv27 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 96, Y: 28, X: 38, R: 1, S: 1 }
}

Layer conv28 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 32, Y: 28, X: 38, R: 1, S: 1 }
}

Layer conv29 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 96, Y: 28, X: 38, R: 3, S: 3 }
}

Layer conv30 { 
	Type: CONV
	Dimensions: { N: 1, K: 24, C: 96, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv31 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 24, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv32 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 96, Y: 28, X: 38, R: 1, S: 1 }
}

Layer conv33 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 32, Y: 28, X: 38, R: 1, S: 1 }
}

Layer conv34 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 96, Y: 28, X: 38, R: 3, S: 3 }
}

Layer conv35 { 
	Type: CONV
	Dimensions: { N: 1, K: 24, C: 96, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv36 { 
	Type: CONV
	Dimensions: { N: 1, K: 96, C: 24, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv37 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 96, Y: 28, X: 38, R: 1, S: 1 }
}

Layer conv38 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 32, Y: 28, X: 38, R: 1, S: 1 }
}

Layer conv39 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 28, X: 38, R: 5, S: 5 }
}

Layer conv40 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 128, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv41 { 
	Type: CONV
	Dimensions: { N: 1, K: 192, C: 64, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv42 { 
	Type: CONV
	Dimensions: { N: 1, K: 192, C: 192, Y: 14, X: 19, R: 3, S: 3 }
}

Layer conv43 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 192, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv44 { 
	Type: CONV
	Dimensions: { N: 1, K: 192, C: 64, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv45 { 
	Type: CONV
	Dimensions: { N: 1, K: 192, C: 192, Y: 14, X: 19, R: 3, S: 3 }
}

Layer conv46 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 192, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv47 { 
	Type: CONV
	Dimensions: { N: 1, K: 192, C: 64, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv48 { 
	Type: CONV
	Dimensions: { N: 1, K: 192, C: 192, Y: 14, X: 19, R: 3, S: 3 }
}

Layer conv49 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 192, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv50 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv51 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 19, R: 5, S: 5 }
}

Layer conv52 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 256, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv53 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv54 { 
	Type: CONV
	Dimensions: { N: 1, K: 112, C: 256, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv55 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 112, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv56 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 336, Y: 14, X: 19, R: 5, S: 5 }
}

Layer conv57 { 
	Type: CONV
	Dimensions: { N: 1, K: 88, C: 336, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv58 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 88, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv59 { 
	Type: CONV
	Dimensions: { N: 1, K: 112, C: 336, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv60 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 112, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv61 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 336, Y: 14, X: 19, R: 5, S: 5 }
}

Layer conv62 { 
	Type: CONV
	Dimensions: { N: 1, K: 88, C: 336, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv63 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 88, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv64 { 
	Type: CONV
	Dimensions: { N: 1, K: 112, C: 336, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv65 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 112, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv66 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 336, Y: 14, X: 19, R: 5, S: 5 }
}

Layer conv67 { 
	Type: CONV
	Dimensions: { N: 1, K: 88, C: 336, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv68 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 88, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv69 { 
	Type: CONV
	Dimensions: { N: 1, K: 112, C: 336, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv70 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 112, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv71 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 336, Y: 14, X: 19, R: 5, S: 5 }
}

Layer conv72 { 
	Type: CONV
	Dimensions: { N: 1, K: 88, C: 336, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv73 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 88, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv74 { 
	Type: CONV
	Dimensions: { N: 1, K: 112, C: 336, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv75 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 112, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv76 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 336, Y: 14, X: 19, R: 5, S: 5 }
}

Layer conv77 { 
	Type: CONV
	Dimensions: { N: 1, K: 88, C: 336, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv78 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 88, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv79 { 
	Type: CONV
	Dimensions: { N: 1, K: 112, C: 336, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv80 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 112, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv81 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 336, Y: 14, X: 19, R: 5, S: 5 }
}

Layer conv82 { 
	Type: CONV
	Dimensions: { N: 1, K: 88, C: 336, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv83 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 88, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv84 { 
	Type: CONV
	Dimensions: { N: 1, K: 112, C: 336, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv85 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 112, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv86 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 336, Y: 14, X: 19, R: 5, S: 5 }
}

Layer conv87 { 
	Type: CONV
	Dimensions: { N: 1, K: 88, C: 336, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv88 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 88, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv89 { 
	Type: CONV
	Dimensions: { N: 1, K: 112, C: 336, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv90 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 112, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv91 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 336, Y: 14, X: 19, R: 5, S: 5 }
}

Layer conv92 { 
	Type: CONV
	Dimensions: { N: 1, K: 88, C: 336, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv93 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 88, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv94 { 
	Type: CONV
	Dimensions: { N: 1, K: 112, C: 336, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv95 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 112, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv96 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 336, Y: 14, X: 19, R: 5, S: 5 }
}

Layer conv97 { 
	Type: CONV
	Dimensions: { N: 1, K: 88, C: 336, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv98 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 88, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv99 { 
	Type: CONV
	Dimensions: { N: 1, K: 112, C: 336, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv100 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 112, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv101 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 336, Y: 14, X: 19, R: 5, S: 5 }
}

Layer conv102 { 
	Type: CONV
	Dimensions: { N: 1, K: 88, C: 336, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv103 { 
	Type: CONV
	Dimensions: { N: 1, K: 336, C: 88, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv104 { 
	Type: CONV
	Dimensions: { N: 1, K: 112, C: 336, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv105 { 
	Type: CONV
	Dimensions: { N: 1, K: 15, C: 112, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv106 { 
	Type: CONV
	Dimensions: { N: 1, K: 60, C: 112, Y: 14, X: 19, R: 1, S: 1 }
}

Layer conv107 { 
	Type: CONV
	Dimensions: { N: 1, K: 448, C: 112, Y: 6, X: 6, R: 1, S: 1 }
}

Layer conv108 { 
	Type: CONV
	Dimensions: { N: 1, K: 448, C: 448, Y: 6, X: 6, R: 5, S: 5 }
}

Layer conv109 { 
	Type: CONV
	Dimensions: { N: 1, K: 112, C: 448, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv110 { 
	Type: CONV
	Dimensions: { N: 1, K: 448, C: 112, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv111 { 
	Type: CONV
	Dimensions: { N: 1, K: 184, C: 448, Y: 3, X: 3, R: 1, S: 1 }
}

Layer conv112 { 
	Type: CONV
	Dimensions: { N: 1, K: 736, C: 184, Y: 3, X: 3, R: 1, S: 1 }
}

Layer conv113 { 
	Type: CONV
	Dimensions: { N: 1, K: 736, C: 736, Y: 3, X: 3, R: 3, S: 3 }
}

Layer conv114 { 
	Type: CONV
	Dimensions: { N: 1, K: 184, C: 736, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv115 { 
	Type: CONV
	Dimensions: { N: 1, K: 736, C: 184, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv116 { 
	Type: CONV
	Dimensions: { N: 1, K: 184, C: 736, Y: 3, X: 3, R: 1, S: 1 }
}

Layer conv117 { 
	Type: CONV
	Dimensions: { N: 1, K: 736, C: 184, Y: 3, X: 3, R: 1, S: 1 }
}

Layer conv118 { 
	Type: CONV
	Dimensions: { N: 1, K: 736, C: 736, Y: 3, X: 3, R: 3, S: 3 }
}

Layer conv119 { 
	Type: CONV
	Dimensions: { N: 1, K: 184, C: 736, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv120 { 
	Type: CONV
	Dimensions: { N: 1, K: 736, C: 184, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv121 { 
	Type: CONV
	Dimensions: { N: 1, K: 184, C: 736, Y: 3, X: 3, R: 1, S: 1 }
}

Layer conv122 { 
	Type: CONV
	Dimensions: { N: 1, K: 736, C: 184, Y: 3, X: 3, R: 1, S: 1 }
}

Layer conv123 { 
	Type: CONV
	Dimensions: { N: 1, K: 736, C: 736, Y: 3, X: 3, R: 3, S: 3 }
}

Layer conv124 { 
	Type: CONV
	Dimensions: { N: 1, K: 184, C: 736, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv125 { 
	Type: CONV
	Dimensions: { N: 1, K: 736, C: 184, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv126 { 
	Type: CONV
	Dimensions: { N: 1, K: 184, C: 736, Y: 3, X: 3, R: 1, S: 1 }
}

Layer conv127 { 
	Type: CONV
	Dimensions: { N: 1, K: 736, C: 184, Y: 3, X: 3, R: 1, S: 1 }
}

Layer conv128 { 
	Type: CONV
	Dimensions: { N: 1, K: 736, C: 736, Y: 3, X: 3, R: 3, S: 3 }
}

Layer conv129 { 
	Type: CONV
	Dimensions: { N: 1, K: 184, C: 736, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv130 { 
	Type: CONV
	Dimensions: { N: 1, K: 736, C: 184, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv131 { 
	Type: CONV
	Dimensions: { N: 1, K: 184, C: 736, Y: 3, X: 3, R: 1, S: 1 }
}

Layer conv132 { 
	Type: CONV
	Dimensions: { N: 1, K: 1104, C: 184, Y: 3, X: 3, R: 1, S: 1 }
}

Layer conv133 { 
	Type: CONV
	Dimensions: { N: 1, K: 1104, C: 1104, Y: 3, X: 3, R: 5, S: 5 }
}

Layer conv134 { 
	Type: CONV
	Dimensions: { N: 1, K: 280, C: 1104, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv135 { 
	Type: CONV
	Dimensions: { N: 1, K: 1104, C: 280, Y: 1, X: 1, R: 1, S: 1 }
}

Layer conv136 { 
	Type: CONV
	Dimensions: { N: 1, K: 200, C: 1104, Y: 3, X: 3, R: 1, S: 1 }
}

Layer fc1 { 
	Type: CONV
	Dimensions: { N: 1, K: 81, C: 200, Y: 200, X: 1, R: 1, S: 1 }
}

Layer fc2 { 
	Type: CONV
	Dimensions: { N: 1, K: 320, C: 200, Y: 200, X: 1, R: 1, S: 1 }
}

}

