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
