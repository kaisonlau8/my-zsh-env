# my-zsh-env

一套开箱即用的 zsh 终端环境配置，一条命令完成部署。

## 包含什么

| 组件 | 说明 |
|------|------|
| **Oh My Zsh** | zsh 框架 + git/z/fzf/gh 插件 |
| **Starship** | 跨 shell 的轻量 prompt，显示 git/python/node/deno/go 等 |
| **zsh-autosuggestions** | 根据历史记录灰度提示补全 |
| **zsh-syntax-highlighting** | 命令实时语法高亮 |
| **zsh-history-substring-search** | 上下箭头按前缀搜索历史 |
| **fzf** | 模糊搜索文件、历史、进程 |
| **Conda** | 延迟加载，首次使用时才初始化，不拖慢启动 |
| **gh** | GitHub CLI 补全 |

## 快速安装

在新 Mac 上执行：

```bash
git clone https://github.com/kaisonlau8/my-zsh-env.git ~/dotfiles
cd ~/dotfiles && ./setup.sh
```

脚本会自动安装 Homebrew、Oh My Zsh、所有 brew 依赖，并部署配置文件。

安装完成后打开新终端窗口即可生效。

## API 密钥

脚本不会覆盖已有的 `~/.env.secrets`。首次安装时会生成模板，手动填入你的密钥：

```bash
nano ~/.env.secrets
```

## 文件说明

```
~/dotfiles/
├── .zshrc            # zsh 主配置
├── starship.toml     # Starship prompt 配置
└── setup.sh          # 一键部署脚本
```

部署后实际生效的文件：
- `~/.zshrc` — zsh 配置
- `~/.config/starship.toml` — Starship 配置
- `~/.env.secrets` — API 密钥（不纳入仓库，每台机器单独管理）

## 自定义

- **别名**：编辑 `~/.zshrc` 的 Aliases 段落
- **Prompt 样式**：编辑 `~/.config/starship.toml`
- **插件**：修改 `~/.zshrc` 的 `plugins=()` 行

修改后记得同步回 dotfiles 仓库：

```bash
cp ~/.zshrc ~/dotfiles/.zshrc
cp ~/.config/starship.toml ~/dotfiles/starship.toml
cd ~/dotfiles && git add -A && git commit -m "update config" && git push
```

## 卸载

如需恢复默认 zsh 环境：

```bash
rm ~/.zshrc ~/.config/starship.toml
uninstall_oh_my_zsh  # 移除 Oh My Zsh
# 其余 brew 包可按需 brew uninstall
```

## License

MIT
