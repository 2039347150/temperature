const webpack = require('webpack')
module.exports = {
  configureWebpack: {
    resolve: {
      extensions: [], // 省略后缀名的配置
      alias: {
        // 默认 '@': 'src'
        'assets': '@/assets',
        'common': '@/common',
        'components': '@/components',
        'network': '@/network',
        'views': '@/views',
        // 'router': '@/router' 不需要给router和store配置别名，因为有this.$router和this.$store
      }
    }
  },
  devServer: {
    port: 8000,
    host: '127.0.0.1',
    https: false,
    open: true,
    proxy: {  //配置跨域
      '/api': {
        target: 'http://127.0.0.1:3000/',  //这里后台的地址模拟的;应该填写你们真实的后台接口
        changOrigin: true,  //允许跨域
        pathRewrite: {
          /* 重写路径，当我们在浏览器中看到请求的地址为：http://localhost:8080/api/core/getData/userInfo 时
            实际上访问的地址是：http://121.121.67.254:8185/core/getData/userInfo,因为重写了 /api
           */
          '^/api': ''
        }
      },
    }
  },

}
