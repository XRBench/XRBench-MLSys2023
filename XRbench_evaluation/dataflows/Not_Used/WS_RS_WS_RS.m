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
    TemporalMap(1,1) Y'; // '
    TemporalMap(16,16) X'; //'
    TemporalMap(1,1) K;    
    SpatialMap(1,1) C;    
    Cluster(16,P);
    TemporalMap(1,1) Y';    
    SpatialMap(1,1) X';
    TemporalMap(1,1) K;
    TemporalMap(1,1) C;    
    Cluster(8,P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
 }


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
    TemporalMap(1,1) Y'; // '
    TemporalMap(16,16) X'; //'
    TemporalMap(1,1) K;    
    SpatialMap(1,1) C;    
    Cluster(16,P);
    TemporalMap(1,1) Y';    
    SpatialMap(1,1) X';
    TemporalMap(1,1) K;
    TemporalMap(1,1) C;    
    Cluster(8,P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
 }
