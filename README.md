# A Web Application for 2D Rubik’s Cube Simulation and Solving Assistance

## What It Is and Its Purpose
This project is a web application that simulates a 3×3×3 Rubik’s Cube in a 2D circular layout. Users can perform individual cube moves or full sequences, scramble the cube, reset it, and receive step-by-step solving assistance via the Layer-By-Layer (LBL) algorithm. Its primary goal is to offer an intuitive, minimalistic visualization and interactive experience for both learning and practicing Rubik’s Cube solving.

## Project Characteristics
- **Dual-application architecture**:
  1. **Terminal application**: Implements all core cube logic, state representation, move operations, scramble, reset, and solving algorithms. Serves as a library for the web layer and for testing.
  2. **Web application**: Built with Elixir and Phoenix, it uses the terminal app’s logic for visualization and user interaction in the browser.
- **Technology stack**:
  - **Elixir** for functional backend logic
  - **Phoenix** for the web framework
  - **HTML/CSS** for the frontend interface
- **API endpoints**:
  - `GET /{move}`: Execute a single move (e.g., `R`, `L'`).
  - `POST /sequence`: Execute a sequence of moves.
  - `GET /scramble`: Apply a random scramble of 20 moves.
  - `GET /reset`: Reset cube to the solved state.
  - `GET /solve`: Return the LBL solution sequence for the current state.

## Explanation of the Visual Component
- **Circle-based layout**: Instead of the conventional 2D net or 3D rendering, the cube is unfolded into 9 circles, each representing one face of the cube.
  - Imagine cutting the cube into nine small 3×3 grids (receptures) arranged in 3×3 rows. When laid flat, they form nine proportional circles corresponding to each face and its spatial neighbor relations.
- **Benefits**:
  - **All faces visible** simultaneously—no hidden or occluded stickers.
  - **Natural adjacency**—neighboring circles correspond to physically adjacent faces, reducing cognitive load compared to flat nets.

## Explanation of Cube Logic
### Alternative Cube State Representation
- Standard 3D arrays are replaced by a **map** whose keys are named circles (e.g., `vertical_right_side`) and values are **1D lists of 12 stickers**.  
- Each circle list holds the 12 stickers that border or rotate around that circle.  
- This mapping enables a clean separation of face rotations and simplifies both move operations and scalability to larger cubes.

### Solving Algorithms
- **Layer-By-Layer (LBL)** method: A simple, intuitive algorithm that solves the cube in these steps:
  1. **Orient base face**: Rotate the cube so the white face is down.
  2. **White cross**: Place the four white edge pieces around the white center.
  3. **White corners**: Insert all white corner pieces to complete the first face.
  4. **Middle layer edges**: Position the four edge pieces in the second layer.
  5. **Top cross**: Form the yellow cross on the last layer.
  6. **Top face corners**: Orient and position the last-layer corners to finish the cube.
- **Solution assistance**: The web app’s `GET /solve` endpoint runs the LBL solver on the current state and returns the full sequence of moves required to solve it.

### Move Algorithms (Basic R and L Moves)
- **Face rotation**: Each circle list is treated as cyclic; rotating a face by one quarter-turn corresponds to rotating its list by 3 positions.
- **Adjacent updates**: Only specific slices of the neighboring lists are affected. An efficient algorithm updates just the changed stickers (only 14 stickers per move vs. 96 in a naive approach).
- **Extensibility**: Because each face and its adjacency are abstracted via named lists, the same rotation algorithm can be extended to 4×4×4 or larger cubes by adjusting list lengths.

### Summary of Logic Section
- **Map-based state**: Keys = circle names, values = cyclic sticker lists.
- **Efficient rotations**: Minimal sticker updates, scalable.
- **LBL solver**: Clear six-step process, full solution sequence output.

## Conclusion and Further Work
This application demonstrates a novel 2D circle-based visualization, clean functional logic in Elixir, and an integrated solver for teaching and practice. Potential enhancements include:
- **Interactive animations** for face rotations.
- **Drag-and-rotate** interface instead of buttons.
- **Support for larger cubes** (4×4×4, etc.) using the same adjacency map.
- **Front-end explanatory guides** for each algorithmic step.

---

## Getting Started
1. Install Elixir and Phoenix:
   ```bash
   mix local.hex
   mix archive.install hex phx_new
   ```
2. Clone the repo and fetch dependencies:
   ```bash
   git clone <repo_url>
   cd rubic_app
   mix deps.get
   ```
3. Start the Phoenix server:
   ```bash
   mix phx.server
   ```
4. Open your browser at `http://localhost:4000` and start interacting with the cube!

---

*Developed by Konrad Bolesta*

