
// Balanced DLA++
// Dataflow {
//  TemporalMap(32,32) K;
//  TemporalMap(8,8) C;
//  SpatialMap(1,1) Y';
//  TemporalMap(1,1) X';
//  Cluster(32, P);
//  SpatialMap(1,1) K;
//  Cluster(8, P);
//  SpatialMap(1,1) C;
// }

// NVDLA
  Dataflow {
    SpatialMap(1,1) K;
    TemporalMap(64,64) C;
    TemporalMap(1,1) Y';
    TemporalMap(1,1) X';
    Cluster(64, P);
    SpatialMap(1,1) C;
  }


// Hand-optimized row-stationary
  Dataflow {
    TemporalMap(16,16) Y'; // '
    TemporalMap(16,16) X'; //'
    TemporalMap(1,1) K;    
    SpatialMap(1,1) C;    
    Cluster(16,P);
    SpatialMap(1,1) Y';
    TemporalMap(16,16) X';
    TemporalMap(1,1) K;
    TemporalMap(1,1) C;    
    Cluster(4,P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
 }


// Hand-optimized output-stationary
//  Dataflow {
//    TemporalMap(4,4) Y';
//    TemporalMap(1,1) X';
//    SpatialMap(1,1) K;    
//    TemporalMap(64,64) C;
//    Cluster(4,P);
//    SpatialMap(1,1) Y'; //'
//    Cluster(64, P);
//    SpatialMap(1,1) C;
//  }


//Shi diannao style
// Dataflow  {
//  TemporalMap(1,1) C;
//  SpatialMap(1,1) Y';
//  TemporalMap(128,128) X';
//  TemporalMap(16,16) K;    
//  Cluster(128,P);
//  TemporalMap(16,16) K;
//  TemporalMap(1,1) C;  
//  TemporalMap(1,1) Y';
//  SpatialMap(1,1) X';
// }

//    Dataflow {
//      TemporalMap(1,1) C;     
//      TemporalMap(16,16) Y';
//      TemporalMap(3,1) X;
//      SpatialMap(1,1) K;
//      TemporalMap(3,3) R;
//      TemporalMap(3,3) S;
//      Cluster(16, P);
//      TemporalMap(1,1) C;     
//      SpatialMap(1,1) Y';
 //     TemporalMap(3,1) X;
//      TemporalMap(1,1) K;
//      TemporalMap(3,3) R;
//      TemporalMap(3,3) S;
//    }


//  RS
//  Dataflow {
//    TemporalMap(4,4) C;
//    TemporalMap(4,4) K;    
//    TemporalMap(3,3) R;
//    TemporalMap(3,3) S;
//    SpatialMap(3,1) Y;
//    TemporalMap(3,1) X;
//    Cluster(3,P);
//    SpatialMap(1,1) Y;
//    SpatialMap(1,1) R;
//    TemporalMap(3,3) S;
// }

