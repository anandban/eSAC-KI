### This repository contains MATLAB codes used to generate figures for the Current Biology paper "BubR1 recruitment to the kinetochore via Bub1 enhances Spindle Assembly Checkpoint signaling"

Description of files in the folder Figure1
- Fig1E.m - Used to make different curves in Fig. 1E.
- SupplementaryFigures1.m - Contains codes for generating all the figure panels in supplementary figure 1.
-	He_model_new.xlsx – Contains all the reactions included in the model. 
-	eSACKI_script.m - Reads the above Excel file and uses rx_rates.m to create a new file (He_model_odes.m) with the Ordinary Differential Equations corresponding to the model.
-	He_new.m - Used to calculate the time in mitosis at a given eSAC concentration.
-	He_new_ic.m - Used to calculate the initial conditions for the simulation (concentration of various Bub1 bound species). 
-	He_par.m - Contains all the model parameters.   

Description of files in the folder Figure3
- Fig3B.m to Fig 3E.m - Contains files to produce the corresponding figures in the manuscript.
- SupplementaryFigures3.m - Contains codes for generating all the figure panels in supplementary figure 3.
- esac2_conc.m - Used to calculate the equilibrium concentration of all the MELT and KI motif bound species at a given eSAC concentration.
- esac2_par.m - Contains the parameters for metaphase to anaphase transiton model (based on He et. al., model).
- exit_time.m - Used to calculate the time in mitosis at a given eSAC concentration.
- kasmcc.m - Used to calculate the effective eSAC concentration ([eSAC]<sub>T</sub> in Eq. 15 of manuscript) and the effective MCC formation rate (k<sub>asmcc</sub>) in Eq. 18 of manuscript).
- kd_par.m - Contains paramaters for the reversible binding beteween MELT and Bub1, Bub1 and BubR1, KI1 and Bub1, and KI2 and BubR1.
- km_par.m - Outputs the MCC formation rate constant values for eSAC with different MELT occupancy.
- saturation_contourmap.m - Used to generate the data (contourdata.txt) for the heatmap in Fig. 3D.    
