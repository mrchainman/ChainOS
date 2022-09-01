from libqtile.config import Group, Key, Match, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile import qtile
from utils.settings import workspace_names
from modules.keys import keys, mod, shift
# from libqtile.backend.base import Window, Internal
# from libqtile import hook

# @hook.subscribe.setgroup
# def mpv_follow():
#     for w in qtile.windows_map.values():
#         if not isinstance(w, Internal):
#             if w.get_wm_class() == "mpv":
#                 w.togroup()

workspaces = [
    {"name": workspace_names[0], "key": "1", "matches": [Match(wm_class="qutebrowser")], "lay": "monadtall"},
    {"name": workspace_names[1], "key": "2", "matches": [Match(wm_class="coms")], "lay": "columns"},
    {"name": workspace_names[2], "key": "3", "matches": [Match(wm_class="mon")], "lay": "columns"},
    {"name": workspace_names[3], "key": "4", "matches": [Match(wm_class="neovim")], "lay": "columns"},
    {"name": workspace_names[4], "key": "5", "matches": [Match(wm_class="Spotify")], "lay": "columns"},
    {"name": workspace_names[5], "key": "6", "matches": [Match(wm_class="Jitsi Meet")], "lay": "floating"},
    {"name": workspace_names[6], "key": "7", "matches": [Match(wm_class="TeamworkTimer"),Match(wm_class="KeePassXC")], "lay": "floating"},
]

groups = [Group(i) for i in "123456789"]

for workspace in workspaces:
    matches = workspace["matches"] if "matches" in workspace else None
    groups.append(Group(workspace["name"], matches=matches, layout=workspace["lay"]))
    keys.append(
        Key(
            [mod],
            workspace["key"],
            lazy.group[workspace["name"]].toscreen(toggle=True),
            desc="Focus this desktop",
        )
    )
    keys.append(
        Key(
            [mod, shift],
            workspace["key"],
            *(
                lazy.window.togroup(workspace["name"]),
                lazy.group[workspace["name"]].toscreen(toggle=True),
            ),
            desc="Move focused window to another group",
        )
    )

groups.append(
    ScratchPad(
        "scratchpad",
        [
            DropDown(
                "term",
                "kitty --listen-on=unix:@scratch",
                opacity=1,
                x=0.1,
                y=0.15,
                width=0.8,
                height=0.7,
                on_focus_lost_hide=False,
            ),
        ],
    )
)
