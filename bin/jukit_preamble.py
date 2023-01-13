import sys

sys.path.append(
    "/home/renat/.local/share/nvim/site/pack/packer/start/vim-jukit/helpers"
)
import matplotlib
import matplotlib.pyplot as plt

matplotlib.use("module://matplotlib-backend-kitty")
plt.show.__annotations__["save_dpi"] = 150
import matplotlib.pyplot as plt

plt.style.use(
    "/home/renat/.local/share/nvim/site/pack/packer/start/vim-jukit/helpers/matplotlib-backend-kitty/backend.mplstyle"
)
