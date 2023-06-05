// tmp verison; top and col order needs to be maintained


Accelerator Acc0_2K {
  num_pes: 2048
  offchip_bw: 128
  top_noc_bw: 128
  top_noc_latency: 1
  top_noc_multicast: True  
  col_noc_bw: 128
  col_noc_latency: 1
  col_noc_multicast: True
  global_shared_memory: 2097152 // 2 MiB
  PE_local_memory: 8192 // 8KiB
}

Accelerator Acc1_2K {
  num_pes: 2048
  offchip_bw: 128
  top_noc_bw: 128
  top_noc_latency: 1
  top_noc_multicast: True  
  col_noc_bw: 128
  col_noc_latency: 1
  col_noc_multicast: True
  global_shared_memory: 2097152 // 2 MiB
  PE_local_memory: 8192 // 8KiB
}
