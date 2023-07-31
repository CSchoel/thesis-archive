# Dissertation archive of C. Schölzel

This archive contains all datasets, code and analyses that I created during my PhD thesis and that were not already published elsewhere.

Where third-party rights are involved, I link to private repositories at my working group, which can be accessed upon request to [Prof. Dr. Andreas Dominik](https://www.thm.de/mni/andreas-peter-dominik).
For the case that these repositories are no longer available in the future, I also keep a private copy of them myself.

Some parts are still marked as TODO, which means that the files are not yet uploaded to this repository or not fully described.

## Data

### Model Parameters and variables

* `data/Healthy_range_for_HRV_measures.fods`: References for which value ranges of HRV measures are to be considered "normal" for a healthy population.
* `data/SHM_parameters.fods`: Parameter names and values in SHM across various different papers and implementations.
* `data/HodgkinHuxley_Performance_Matlab_JSim_Modelica.fods`: Performance comparison between Matlab, JSim and Modelica using freely available and or own implementations of the Hodgkin-Huxley model.
  * Modelica implementation: [HHMono (C. Schölzel)](https://github.com/CSchoel/hh-modelica/blob/e84713a4a15bfcc5736755940e6af38bb6272521/HHmodelica/CompleteModels/HHmono.mo)
  * JSim implementation: `code/reference_models/hodgkin_huxley/jsim` (J. B. Bassingthwaighte)
  * CellML implementation (OpenCOR): [Physiome Repository](https://models.physiomeproject.org/workspace/hodgkin_huxley_1952) (Catherine Lloyd, changeset a49243bad279)
  * MATLAB and Octave implementations: `git@magrathea.mni.thm.de:2016-ilgen-biomodels.git` (Denis Ilgen, [see below](#preliminary-studies-performed-by students))
* `data/Inada_compare_equations_and_parameters.fods`: Detailed list of all parameters and equations of the Inada2009 model, comparing the C++, CellML, and Modelica implementations.

### Small research studies performed for papers

#### InaMo

* `data/inamo/reproducibility_suggestions_literature.fods`: Overview of suggestions for increasing reproducibility given by researchers in the literature
* `data/inamo/inada_citations.fods`: Literature research to count number of research groups that reused Inada2009 model for simulations.
* `data/inamo/inada_work_items.fods`: Estimation of time required for implementing InaMo split into different phases.

### Dissertation

* `data/diss/dde_sde_support.fods`: Overview of support for Stochastic Differential Equations (SDE) and Delay Differential Equations (DDE) in different modeling languages.
* `data/diss/language_popularity.fods`: Estimation of modeling language popularity in systems biology by counting papers that match keywords.
* `data/diss/modelica_association.fods`: Statistics about members of the Modelica Association (research vs industry).
* `data/diss/modelica_community_size.fods`: Numbers to estimate the size of the developer communities of Modelica and SBML/CellML.
* `data/diss/SBML_comp_support.fods`: Numbers about support of the SBML-comp package.

## Plots

### Result plots saved for laboratory notebook

TODO: results

## Code

### Jupyter notebook: Power of frequency bands

The notebook in `code/notebooks/PSD of frequency bands.ipynb` contains my learning notes about what the power spectral density (PSD) of a HRV signal is and how it can be computed and interpreted.

### Preliminary studies performed by students

For these projects, you need access to [Magrathea](https://magrathea.mni.thm.de/), the internal Redmine instance used by the working group of Prof. Dr. Andreas Dominik.
If you are interested in this work, please either contact Prof. Dominik or me via mail.

* [MATLAB implementations of Hodgkin-Huxley (1952), Noble (1962), and Inada (2009) models by Dennis Ilgen](https://magrathea.mni.thm.de/projects/ilgen-matlab-biomodels/repository/2016-ilgen-biomodels/revisions/master/show)
* [Modelica implementation of Noble (1962) model by Peter Koch](https://magrathea.mni.thm.de/projects/oertel-koch-modelica-biomodels/repository/2016-oertel-koch-biomodels/revisions/master/show)
* [MATLAB and Modelica implementations of Inada (2009) model by Elias Kupferschmitt](https://magrathea.mni.thm.de/projects/kupferschmitt-inada2009/repository/2019-kupferschmitt-inada2009/revisions/master/show)
* [Automatic conversion between Modelica code and JSim/CellML with Scala by Rodney Tabernero](https://magrathea.mni.thm.de/projects/2019-tabernero-jsim2modelica)
* Java version of the Kotani variant of the Seidel-Herzel model by Daniel Otto with updates by me and Valeria Blesius (git clone `git@magrathea.mni.thm.de:2014-kotani-CS-VE.git`)


### Comparison between output of Java and Modelica versions of the Kotani variant of the SHM

* Plotting code can be found in `code/compare_kotani_modelica/rscripts`.
* Data for the Modelica version is in `code/compare_kotani_modelica/kotani_full_res.csv`.
* Data for the Java version is in `code/compate_kotani_modelica/silicon000.phi`.

### Early Modelica models

The folder `code/early_models` contains early experiments with Modelica:

* `first_steps`: First steps with Modelica using a Notebook and the Lotka-Volterra model.
* `HackVolterra`: Small Lotka-Volterra example to explain Modelica to students at the THM-MNI Hack.a.day conference.
* `ISA`: Lotka-Volterra-example and example problems for a presentation at the institute for software architecture (ISA) at the THM.
* `LotkaVolterra2`: Early Lotka-Volterra example that I used to test Modelica functionality.
* `MAPK`: First version of a mitogen-activated protein kinase (MAPK) model example that I used to understand modular modeling with Modelica at a larger scale than Lotka-Volterra.
* `MAPKExp`: Second version of the second version of the MAPK model with a reduced number of connectors and better code reuse.
* `MapleMopdel`: Experiments with MapleSoft using basic electrical circuits.
* `SawToothTest`: Early experiments with Modelica for creating a saw tooth signal.
* `LotkaVolterra-thesis`: Lotka-Volterra model that is used in my PhD thesis to illustrate the syntax of Modelica.

#### BioModels analysis

In `code/other/biomodels-analysis` you can find the code and instructions to replicate the search for models that use the SBML level 3 package `comp` on [BioModels](https://www.ebi.ac.uk/biomodels).

### Guidelines

When I started working with Modelica, I came up with a plan to provide other users who switch to Modelica from a biological setting with a set of guidelines and a list of pitfalls to avoid.
Unfortunately, I was never able to finish this project, but I did collect a few example models, which can be found in `code/guidelines`.
In particular, this folder contains the following experiments:

* `MoGuide/DiscreteEquations`: An investigation about an error that OpenModelica is unable to solve "discrete equation systems", which I had with early versions of the SHM.
* `MoGuide/Mixin`: An experiment to use the [Mixin](https://en.wikipedia.org/wiki/Mixin) pattern in Modelica.
* `MoGuide/FiringNerve`: Working with boolean signals as input and output for nerve activity.
* `MoGuide/ArrayFunctions`: Debugs/documents the error that you should not leave array dimensions undefined at runtime.
* `MoGuide/algos`: Contrasts the use of `when` in `equations` and in `algorithm` sections.
* `MoGuide/EquationSwitchTest.mo` and `DynamicExample.mo`: Shows an example of how to switch between two formulations of an equation.
* `MoGuide/IntegrateAndFireExample.mo`: Gives a minimal example of an integrate-and-fire model.
* `MoGuide/TestContraction.mo`: Copy of the early contraction model for the SHM for debugging.
* `MoGuide/UnsteadyTestBad.mo` and `TestGood.mo`: Test for dealing with discontinuities in signals whose derivative needs to be computed.
* `MoGuide/DiscreteSignalExample.mo` and `DiscreteTests.mo`: Tests for working with discrete signals.

The `text` folder contains notes and first guideline texts.

### OMEdit-Docker

Sometimes, I needed to test my code with different OpenModelica versions.
An easy way to do so seemed to build a Docker container.
The code I used for that workflow can be found in `code/other/omedit-docker`.
The experiments were performed under Manjaro with the Wayland display server protocol and the Gnome window manager.
If you have a different setup, you might need to adjust the installation to make it work for you.

### Import analysis

The folder `other/pmr-inmport-analysis` contains code and intermediary data to analyze the frequency of `<import>` declarations in published CellML models.
The script `download_pmr` downloads all models from the Physiome Model Repository and `find_import.sh` finds the files with `<import>` in them.

### Code for plots

The code in `code/plots` constitutes code for plots that were used in papers and presentations related to my PhD.

* `broadening`: Illustrates the broadening function used in the SHM.
* `kotani`: Illustrates the saturation functions in the Kotani variant of the SHM.
* `phase_effectiveness`: Illustrates the phase effectiveness function in the Kotani variant of the SHM.
* `tissue`: Minimal example of how a tissue model might look like.
* `TSTRR-paper`: Helper plot to analyze data in one of the HRT-related papers of my colleague.

### Metascholar

The folder `code/other/metascholar` contains a small script that can take a list of authors (e.g. from a conference) and scrape GoogleScholar to get a list of journals ranked on how often these authors published papers in that journal.
I used it to find ideas for which journals I could target for my own papers.

### Svg2Modelica

An early Ruby implementation of the Modelica Inkscape extension can be found in `code/svg2modelica`.
This code was written prior to [MoVE](https://github.com/THM-MoTE/MoVE) and was eventually superseded by [MoNK](https://github.com/THM-MoTE/MoNK).

### Original version of SHM

The original implementation of the SHM by H. Seidel can be obtained by contacting him.
Additionally, the small modifications that I added to the code can be found on [Magrathea](https://magrathea.mni.thm.de/), the internal Redmine instance used by the working group of Prof. Dr. Andreas Dominik, as `git@magrathea.mni.thm.de:2020-schoelzel-seidel-orig.git`.
If you are interested in this code, please either contact Prof. Dominik or me via mail.

## Notes

### Lab notebook

A scan of my lab notebook can be found under `notes/lab_notebook.pdf`.

### Study of *Cardiovascular physiology concepts*

As part of my preparation for the PhD thesis, I worked through the following text book from start to finish:

Klabunde, R.E. (2012). Cardiovascular physiology concepts (Philadelphia, Pennsylvania: Lippincott Williams & Wilkins).

I took notes in the form of a large mindmap which was generated with [Docear](https://docear.org/) and contains vector graphic images which I created myself and published in the [svgap](https://github.com/CSchoel/svgap) project.

* `notes/cpc/Heart.mm` - Main mindmap file
* `notes/cpc/images` - Image files referenced in Mindmap
* `notes/cpc/images/origins.md` - Lists origin of images that I did not create myself
* `notes/cpc/images/animations` - Contains SVG animations of the ion channel states during an action potential, also published separately as [svgap](https://github.com/CSchoel/svgap).

### Early studies of the Kotani models and the SHM

TODO: kotani-for-dummies, project paper, shm-formulas

## Slides

TODO: Vorträge und Veröffentlichungen

### Conference slides

Conference slides and raw LaTeX versions of all papers can be found on Magrathea, the internal Redmine instance used by the working group of Prof. Dr. Andreas Dominik. under the project name [2014-schoelzel-paper](https://magrathea.mni.thm.de/projects/schoelzel-modelica-sysbio/repository/2014-schoelzel-paper).
