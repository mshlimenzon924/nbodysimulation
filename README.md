# **N-Body Simulation with SYCL for Intel GPUs**

## **Overview**
This project implements an **N-Body simulation** to model gravitational interactions between celestial bodies. The simulation is written in **C and C++** and is accelerated using **SYCL** to leverage **Intel GPUs** for improved performance. The project includes:
- **Sequential CPU implementation (C with OpenMP)**
- **Parallelized GPU implementation using SYCL**
- **Performance comparison between CPU and GPU versions**

This project is structured as a **Jupyter Notebook** (`nbodysimulation.ipynb`), enabling easy execution and visualization of performance improvements.

---

## **Project Files**
This Jupyter Notebook requires the following **supporting files**:

1. **Main Source Files**
   - `nbody.c`: Sequential **CPU-based N-Body simulation** (with OpenMP for parallelism).
   - `nbody.cpp`: Optimized **SYCL-based GPU N-Body simulation** for Intel GPUs.

2. **Helper Files**
   - `timer.h`: Utility for **measuring execution time** across CPU and GPU versions.
   - `shmoo-cpu-nbody.sh`: Bash script for **compiling and running the CPU version**.
   - `shmoo-gpu-nbody.sh`: Bash script for **compiling and running the GPU version**.

---

## **Installation & Setup**
### **1. Ensure Jupyter Notebook is Installed**
If Jupyter Notebook is not installed, install it with:

`pip install notebook`

Launch Jupyter Notebook:

`jupyter notebook`

Open **nbodysimulation.ipynb** in Jupyter.

### **2. Install Required Compilers**
To compile and run the **CPU version**, install GCC:

`sudo apt install gcc`

To compile and run the **GPU version (SYCL)**, install Intel’s oneAPI DPC++ compiler:

`sudo apt install intel-oneapi-compiler-dpcpp`

---

## **How to Run the Simulation**
### **1. Running the CPU Version**
Inside Jupyter Notebook, execute:

`! gcc -std=c99 -O3 -fopenmp -DSHMOO -o nbody nbody.c -lm`  
`! chmod +x shmoo-cpu-nbody.sh`  
`! ./shmoo-cpu-nbody.sh`  

### **2. Running the GPU Version**
Inside Jupyter Notebook, execute:

`! icpx -fsycl -std=c++17 -O3 -DSHMOO -o nbody nbody.cpp -lm`  
`! chmod +x shmoo-gpu-nbody.sh`  
`! ./shmoo-gpu-nbody.sh`  

---

## **Understanding the Code**
### **1. CPU-Based Simulation (`nbody.c`)**
- Uses **OpenMP** for **parallelized force calculations**.
- Iterates over `nBodies` and updates positions based on gravitational interactions.

### **2. GPU-Based Simulation (`nbody.cpp`)**
- Uses **SYCL** for **Intel GPU acceleration**.
- Offloads **bodyForce** and **integration** computations to **GPU kernels**.
- Uses **SYCL queues** for scheduling parallel execution.

---

## **Performance Comparison**
| nBodies | CPU Time (seconds) | GPU Time (seconds) |
|---------|------------------|------------------|
| 1024    | 0.005           | 0.00016         |
| 8192    | 0.243           | 0.0018          |
| 65536   | 9.417           | 0.0178          |
| 524288  | 604.113         | 0.7758          |

**Key Observations:**
- The **SYCL-based GPU version** achieves a **massive speed-up** compared to the **sequential CPU version**.
- At `524K` bodies, the CPU took **604 seconds**, while the GPU only needed **0.8 seconds**.

---

## **Key Takeaways**
- **Parallel execution**: The GPU executes force calculations **in parallel** across thousands of threads.
- **SYCL optimization**: Offloading calculations to the **Intel GPU** enables significant speed improvements.
- **Scalability**: The GPU implementation handles **larger datasets efficiently**.

---
