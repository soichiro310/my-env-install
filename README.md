# jupyter-install

## Template installation for jupyter
## They means installation log regarding my-env

## setup order

1. git clone https://github.com/soichiro310/my-env-install.git
1. cd my-env-install
1. git checkout -b feature/command_fix origin/feature/command_fix
1. sh setup.sh　(sh ~/my-env-install/setup.sh)
1. source ~/.bashrc
1. conda create -n general
1. conda activate general
1. sh ~/my-env-install/general.sh
1. echo "conda activate general" >> ~/.bashrc
1. source ~/.bashrc

## jupyter notebook launch
1. ターミナル上で，```jupyter notebook```を実行する

1. ブラウザ上で```http://133.15.24.xx:yyyy```にアクセスする 
    * xxやyyyyの部分は```jupyter_notebook_config.py``` に記述がされている内容に基づく
        ```python
        c.NotebookApp.password = u'sha1:***********************'
        c.NotebookApp.ip = '133.15.24.xx'
        c.NotebookApp.open_browser = False
        c.NotebookApp.port = yyyy 
        c.NotebookApp.notebook_dir = '/home/myname'
        ```
    * 内容は ```cat ~/.jupyter/jupyter_notebook_config.py``` で確認できる

3. ```setup.sh```を実行した際に入力したパスワードを入力すると，Jupyter Notebookが使えるようになる．

