Cellular automatons can be described as discrete and abstract computational units that work on simple rules. Main goal of Cellular automatons is to show that complicated and perplexing behaviors can emerge from simple rules. One such simple and very famous example of it is Conway's Game of Life (shown below is a special case of Conway's Game of Life k/a 'Glider').

In this section we will learn about history, mathematics and many such aspects of cellular automaton. We will start straight away with types and learn their history, special cases and visualizations along with. These visualizations will mostly be done on GPU using WebGL, so if you can't see canvas visual, it probably means that your browser doesn't support it. So. let's get started

Any cellular automaton model works on discrete structures (although continuous ones have been described now but traditionally they were discrete) called grids and every cell in a grid is, well a 'cell'. Every cell can have some state which are defined based upon some set of rules, which dictates how it will look. 

These rules can result in various types of results, based on these results, cellular automatons are divided into 4 categories by Stephen Wolfram
- Class 1: Nearly all initial patterns evolve quickly into a stable, homogeneous state.
- Class 2: Nearly all initial patterns evolve quickly into stable or oscillating structures. Some of the randomness in the initial pattern may filter out, but some remains. 
- Class 3: Nearly all initial patterns evolve in a pseudo-random or chaotic manner. Any stable structures that appear are quickly destroyed by the surrounding noise. 
- Class 4: Nearly all initial patterns evolve into structures that interact in complex and interesting ways, with the formation of local structures that are able to survive for long periods of time.

