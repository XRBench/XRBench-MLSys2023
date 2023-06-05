// NVDLA
  Dataflow {
    TemporalMap(16,16) C;
    TemporalMap(16,16) K;
    TemporalMap(1,1) Y'; //'
    SpatialMap(1,1) X'; //'
    Cluster(16,P);    
    SpatialMap(1,1) K;
    TemporalMap(64,64) C;
    TemporalMap(1,1) Y';
    TemporalMap(1,1) X';
    Cluster(16, P);
    SpatialMap(1,1) C;
  }

// Hand-optimized row-stationary
  Dataflow {
    TemporalMap(1,1) Y'; // '
    TemporalMap(16,16) X'; //'
    TemporalMap(4,4) C;
    SpatialMap(1,1) K;    
    Cluster(16,P);
    TemporalMap(1,1) Y';
    SpatialMap(1,1) X';
    TemporalMap(4,4) C;
    TemporalMap(1,1) K;        
    Cluster(4,P);
    SpatialMap(1,1) Y;
    SpatialMap(1,1) R;
}
