Network KD_res8_narrow {

FPS: 3

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



Network SS_HRViT_b1 {

FPS: 10

Layer conv1 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 3, Y: 224, X: 224, R: 3, S: 3 }
}

Layer conv2 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 32, Y: 112, X: 112, R: 3, S: 3 }
}

Layer conv3 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 64, Y: 56, X: 56, R: 1, S: 1 }
}

Layer conv4 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer fc1 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer conv5 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer fc2 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc3 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc4 { 
	Type: CONV
	Dimensions: { N: 1, K: 4, C: 4, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc5 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer conv6 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv7 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 56, X: 56, R: 5, S: 5 }
}

Layer fc6 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 128, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer conv8 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv9 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 32, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv10 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 1, S: 1 }
}

Layer conv11 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv12 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv13 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer fc7 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer conv14 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer fc8 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc9 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc10 { 
	Type: CONV
	Dimensions: { N: 1, K: 4, C: 4, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc11 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer conv15 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv16 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 56, X: 56, R: 5, S: 5 }
}

Layer fc12 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 128, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc13 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer conv17 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer fc14 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc15 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc16 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc17 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer conv18 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv19 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 28, X: 28, R: 5, S: 5 }
}

Layer fc18 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 256, Y: 784, X: 1, R: 1, S: 1 }
}

Layer conv20 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 64, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv21 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv22 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 32, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv23 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 5, S: 5 }
}

Layer conv24 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 32, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv25 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv26 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 64, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv27 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 1, S: 1 }
}

Layer conv28 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv29 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv30 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv31 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv32 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc19 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer conv33 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer fc20 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc21 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc22 { 
	Type: CONV
	Dimensions: { N: 1, K: 4, C: 4, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc23 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer conv34 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv35 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 56, X: 56, R: 5, S: 5 }
}

Layer fc24 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 128, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc25 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer conv36 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer fc26 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc27 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc28 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc29 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer conv37 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv38 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 28, X: 28, R: 5, S: 5 }
}

Layer fc30 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 256, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc31 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv39 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc32 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc33 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc34 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc35 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv40 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv41 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc36 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc37 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv42 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc38 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc39 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc40 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc41 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv43 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv44 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc42 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc43 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv45 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc44 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc45 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc46 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc47 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv46 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv47 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc48 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc49 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv48 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc50 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc51 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc52 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc53 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv49 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv50 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc54 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc55 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv51 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc56 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc57 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc58 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc59 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv52 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv53 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc60 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc61 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv54 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc62 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc63 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc64 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc65 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv55 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv56 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc66 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv57 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 64, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv58 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 128, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv59 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv60 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 32, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv61 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 128, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv62 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 5, S: 5 }
}

Layer conv63 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 32, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv64 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv65 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 64, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv66 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 1, S: 1 }
}

Layer conv67 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv68 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv69 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv70 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv71 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc67 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer conv72 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer fc68 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc69 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc70 { 
	Type: CONV
	Dimensions: { N: 1, K: 4, C: 4, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc71 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer conv73 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv74 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 56, X: 56, R: 5, S: 5 }
}

Layer fc72 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 128, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc73 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer conv75 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer fc74 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc75 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc76 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc77 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer conv76 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv77 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 28, X: 28, R: 5, S: 5 }
}

Layer fc78 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 256, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc79 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv78 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc80 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc81 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc82 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc83 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv79 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv80 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc84 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc85 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv81 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc86 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc87 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc88 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc89 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv82 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv83 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc90 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc91 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv84 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc92 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc93 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc94 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc95 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv85 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv86 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc96 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc97 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv87 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc98 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc99 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc100 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc101 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv88 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv89 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc102 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc103 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv90 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc104 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc105 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc106 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc107 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv91 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv92 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc108 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc109 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv93 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc110 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc111 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc112 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc113 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv94 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv95 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc114 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv96 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 64, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv97 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 128, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv98 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv99 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 32, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv100 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 128, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv101 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 5, S: 5 }
}

Layer conv102 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 32, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv103 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv104 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 64, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv105 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 9, S: 9 }
}

Layer conv106 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 32, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv107 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 5, S: 5 }
}

Layer conv108 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv109 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv110 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv111 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 1, S: 1 }
}

Layer conv112 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv113 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv114 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv115 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv116 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv117 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv118 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 7, X: 7, R: 3, S: 3 }
}

Layer fc115 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer conv119 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer fc116 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc117 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc118 { 
	Type: CONV
	Dimensions: { N: 1, K: 4, C: 4, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc119 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer conv120 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv121 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 56, X: 56, R: 5, S: 5 }
}

Layer fc120 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 128, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc121 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer conv122 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer fc122 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc123 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc124 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc125 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer conv123 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv124 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 28, X: 28, R: 5, S: 5 }
}

Layer fc126 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 256, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc127 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv125 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc128 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc129 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc130 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc131 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv126 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv127 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc132 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc133 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv128 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc134 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc135 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc136 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc137 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv129 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv130 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc138 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc139 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv131 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc140 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc141 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc142 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc143 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv132 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv133 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc144 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc145 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv134 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc146 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc147 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc148 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc149 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv135 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv136 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc150 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc151 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv137 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc152 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc153 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc154 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc155 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv138 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv139 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc156 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc157 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv140 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc158 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc159 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc160 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc161 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv141 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv142 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc162 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc163 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 256, Y: 49, X: 1, R: 1, S: 1 }
}

Layer conv143 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 7, X: 7, R: 3, S: 3 }
}

Layer fc164 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc165 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc166 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc167 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 49, X: 1, R: 1, S: 1 }
}

Layer conv144 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 7, X: 7, R: 3, S: 3 }
}

Layer conv145 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 7, X: 7, R: 5, S: 5 }
}

Layer fc168 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc169 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 256, Y: 49, X: 1, R: 1, S: 1 }
}

Layer conv146 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 7, X: 7, R: 3, S: 3 }
}

Layer fc170 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc171 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc172 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc173 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 49, X: 1, R: 1, S: 1 }
}

Layer conv147 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 7, X: 7, R: 3, S: 3 }
}

Layer conv148 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 7, X: 7, R: 5, S: 5 }
}

Layer fc174 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 49, X: 1, R: 1, S: 1 }
}

Layer conv149 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 64, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv150 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 128, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv151 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 256, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv152 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv153 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 32, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv154 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 128, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv155 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 256, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv156 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 5, S: 5 }
}

Layer conv157 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 32, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv158 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv159 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 64, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv160 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 256, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv161 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 9, S: 9 }
}

Layer conv162 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 32, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv163 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 5, S: 5 }
}

Layer conv164 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv165 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv166 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv167 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 1, S: 1 }
}

Layer conv168 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv169 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv170 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv171 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv172 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv173 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv174 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 7, X: 7, R: 3, S: 3 }
}

Layer fc175 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer conv175 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer fc176 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc177 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc178 { 
	Type: CONV
	Dimensions: { N: 1, K: 4, C: 4, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc179 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 32, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer conv176 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv177 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 56, X: 56, R: 5, S: 5 }
}

Layer fc180 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 128, Y: 3136, X: 1, R: 1, S: 1 }
}

Layer fc181 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer conv178 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer fc182 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc183 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc184 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc185 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 784, X: 1, R: 1, S: 1 }
}

Layer conv179 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv180 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 28, X: 28, R: 5, S: 5 }
}

Layer fc186 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 256, Y: 784, X: 1, R: 1, S: 1 }
}

Layer fc187 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv181 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc188 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc189 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc190 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc191 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv182 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv183 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc192 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc193 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv184 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer fc194 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc195 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc196 { 
	Type: CONV
	Dimensions: { N: 1, K: 8, C: 8, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc197 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 196, X: 1, R: 1, S: 1 }
}

Layer conv185 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv186 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 14, X: 14, R: 5, S: 5 }
}

Layer fc198 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 512, Y: 196, X: 1, R: 1, S: 1 }
}

Layer fc199 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 256, Y: 49, X: 1, R: 1, S: 1 }
}

Layer conv187 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 7, X: 7, R: 3, S: 3 }
}

Layer fc200 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc201 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc202 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc203 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 49, X: 1, R: 1, S: 1 }
}

Layer conv188 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 7, X: 7, R: 3, S: 3 }
}

Layer conv189 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 7, X: 7, R: 5, S: 5 }
}

Layer fc204 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc205 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 256, Y: 49, X: 1, R: 1, S: 1 }
}

Layer conv190 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 7, X: 7, R: 3, S: 3 }
}

Layer fc206 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc207 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc208 { 
	Type: CONV
	Dimensions: { N: 1, K: 16, C: 16, Y: 49, X: 1, R: 1, S: 1 }
}

Layer fc209 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 49, X: 1, R: 1, S: 1 }
}

Layer conv191 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 7, X: 7, R: 3, S: 3 }
}

Layer conv192 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 512, Y: 7, X: 7, R: 5, S: 5 }
}

Layer fc210 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 1024, Y: 49, X: 1, R: 1, S: 1 }
}

Layer conv193 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 1, S: 1 }
}

Layer conv194 { 
	Type: CONV
	Dimensions: { N: 1, K: 32, C: 32, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv195 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 32, Y: 56, X: 56, R: 1, S: 1 }
}

Layer conv196 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 32, Y: 56, X: 56, R: 1, S: 1 }
}

Layer conv197 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv198 { 
	Type: CONV
	Dimensions: { N: 1, K: 64, C: 64, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv199 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv200 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 64, Y: 28, X: 28, R: 1, S: 1 }
}

Layer conv201 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 128, Y: 56, X: 56, R: 3, S: 3 }
}

Layer conv202 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv203 { 
	Type: CONV
	Dimensions: { N: 1, K: 128, C: 128, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv204 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv205 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 128, Y: 14, X: 14, R: 1, S: 1 }
}

Layer conv206 { 
	Type: CONV
	Dimensions: { N: 1, K: 512, C: 256, Y: 28, X: 28, R: 3, S: 3 }
}

Layer conv207 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv208 { 
	Type: CONV
	Dimensions: { N: 1, K: 256, C: 256, Y: 7, X: 7, R: 3, S: 3 }
}

Layer conv209 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv210 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 256, Y: 7, X: 7, R: 1, S: 1 }
}

Layer conv211 { 
	Type: CONV
	Dimensions: { N: 1, K: 1024, C: 512, Y: 14, X: 14, R: 3, S: 3 }
}

Layer conv212 { 
	Type: CONV
	Dimensions: { N: 1, K: 2048, C: 1024, Y: 7, X: 7, R: 1, S: 1 }
}

Layer fc211 { 
	Type: CONV
	Dimensions: { N: 1, K: 1000, C: 2048, Y: 2048, X: 1, R: 1, S: 1 }
}

}

Network OD_D2go_FasterRCNN {

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

