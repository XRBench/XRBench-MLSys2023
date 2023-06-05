// tmp verison; top and col order needs to be maintained


Accelerator Acc0_4K {
  num_pes: 6144
  offchip_bw: 128
  top_noc_bw: 256
  top_noc_latency: 1
  top_noc_multicast: True  
  col_noc_bw: 256
  col_noc_latency: 1
  col_noc_multicast: True
  global_shared_memory: 4194304 // 4 MiB
  PE_local_memory: 16384 // 16KiB
}

Accelerator Acc1_4K {
  num_pes: 2048
  offchip_bw: 128
  top_noc_bw: 256
  top_noc_latency: 1
  top_noc_multicast: True  
  col_noc_bw: 256
  col_noc_latency: 1
  col_noc_multicast: True
  global_shared_memory: 4194304 // 4 MiB
  PE_local_memory: 16384 // 16KiB
}
