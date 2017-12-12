set :stage, :production
set :rails_env, 'production'
server '52.68.197.80', user: 'ec2-user',
       roles: %w{web app db}  #何サーバーの処理を書くか。今回は同じサーバーで全部動かすのでweb app db全て指定

#sshでEC２に入るのに必要

set :ssh_options, {
                  # ローカル環境のユーザーの秘密鍵ファイルを設定する
                  keys: %w(.ssh/newkeypair.pem),
                  forward_agent: true,
                }