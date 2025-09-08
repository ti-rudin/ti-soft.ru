module.exports = {
  apps: [{
    name: 'ti-soft.ru',
    cwd: '/home/rudin/ti-soft.ru',
    script: 'npm',
    args: 'run serve',
    env: {
      NODE_ENV: 'production',
      VITE_ALLOWED_HOSTS: 'ti-soft.ru',
      PORT: 4001
    },
    error_file: './logs/err.log',
    out_file: './logs/out.log',
    log_file: './logs/combined.log',
    time: true
  }]
}
