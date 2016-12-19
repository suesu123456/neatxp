

# neatxp

##### iOS 项目模板 (提供网络请求，基本扩展，编码规范，项目基本结构)

teatxp ：bash脚本文件，用于团队开发时，成员只需要每次更新此文件便可以更新项目模板

.xctemplate: 项目模板文件夹

 /.gitignore：Xcode项目需要ignore文件配置

/.swiftlint.yml：编码规范配置文件，需要先brew install swiftlint

/Base+Expand：基本服务文件+扩展

/Common：公用文件

/Images：图片

/Libs：第三方包

/Main：ViewCtroller

/Models

/Utils：工具类

##### 部分代码

###### 1.bash脚本文件

```
#!/bin/sh
if [ ! -f "version1.0.tar.gz" ]; then
   curl -OL https://github.com/suesu123456/neatxp/archive/version1.0.tar.gz
fi
if [ ! -d "neatxp-version1.0" ]; then
   tar -zxvf version1.0.tar.gz
fi
folder="$HOME/Library/Developer/Xcode/Templates/"
if [ ! -d "$folder" ]; then
   mkdir "$HOME/Library/Developer/Xcode/Templates/"
fi
folder2="$HOME/Library/Developer/Xcode/Templates/Sue\'s\ Single\ View\ Application.xctemplate"
if [ -d "$folder2" ]; then  
   rm -f folder2
fi
mv -f neatxp-version1.0/Sue\'s\ Single\ View\ Application.xctemplate $HOME/Library/Developer/Xcode/Templates/Sue\'s\ Single\ View\ Application.xctemplate
rm version1.0.tar.gz
if [ -d "neatxp-version1.0" ]; then
   rm -r neatxp-version1.0
fi
```

###### 2..swiftlint.yml编码规范

```
disabled_rules: # rule identifiers to exclude from running
  # - colon
  # - control_statement
  # - file_length
  # - force_cast
  # - function_body_length
  # - leading_whitespace
  - line_length
  # - nesting
  # - operator_whitespace
  # - return_arrow_whitespace
  # - todo
  # - trailing_newline
  # - trailing_whitespace
  # - type_body_length
  # - type_name
  # - variable_name
included: # paths to include during linting. `--path` is ignored if present. takes precendence over `excluded`.
  - Main
excluded: # paths to ignore during linting. overridden by `included`.
  - Carthage
variable_name:
  min_length:
    warning: 0
    error: 0
  excluded:
    - BASE_URL
    - ScaleX
    - ScaleY

```

###### 3.NetBase.swift、NetManager.swift 网络请求

```

class NetBase: NSObject {

    static let sharedInstance: NetBase = NetBase()
    func post(url: String, para: [String: Any]) -> AnyPromise {
        //检查网络
        let reachability = Reachability.forInternetConnection()
        if reachability?.currentReachabilityStatus() == NetworkStatus.NotReachable {
            return AnyPromise( Promise(resolvers: { (_ : (AnyObject) -> Void, reject: (Error) -> Void) in
                reject(NetError.NetNotConnectError as Error)
            }))
        }
        reachability?.startNotifier()
        return AFHTTPSessionManager().post(url, parameters: para)
    }
}


class NetManager: NSObject {
    static let sharedInstance: NetManager = NetManager()
    //登录
    func login ( para: [String: Any]) -> AnyPromise {
        return NetBase.sharedInstance.post(url: "http://192.168.2.182:8181/login", para: para)
    }
}
```