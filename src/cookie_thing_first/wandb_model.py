import wandb
import torch
from cookie_thing_first.model import MyAwesomeModel
api = wandb.Api()
artifact_name = f"s214598/corrupt_mnist/corrupt_mnist_model:v2"
artifact = api.artifact(name = artifact_name)
artifact_dir = artifact.download("./models")
model = MyAwesomeModel()
model.load_state_dict(torch.load("./models/model.pth"))
