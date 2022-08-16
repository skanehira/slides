---
theme: seriph
class: 'text-center'
highlighter: shiki
colorSchema: 'light'
fonts:
  sans: 'Cica'
  serif: 'Cica'
  mono: 'Cica'
background: "book.jpeg"
download: true

---

# Vimからk8sを操作する

<style>
h1 {
  background-color: #2B90B6;
  background-image: linear-gradient(45deg, #4EC5D4 10%, #146b8c 20%);
  background-size: 100%;
}
</style>

---
layout: center

---

# はじめに
<br>

- 本発はk8sの話があまり出ません（すいません）
- k8sを少し勉強した程度の初心者なのでなにか間違ってたら指摘ください

---
layout: center

---

# [k8s.vim](https://github.com/skanehira/k8s.vim)とは

---
layout: center

---

# Vimから直接k8sクラスタを操作できるプラグイン
<br>

**主に次のことができる**

- Pod List
- Pod Describe
- Attach Pods
- Service List
- Service Describe
- Events Watch
- その他...

---
layout: center

---

![](https://i.gyazo.com/38e00915e05eeef62acbe6008c24f540.png)

---
layout: center

---

# モチベーション

<br>

- k8sの勉強をしたいが、完全ガイドを読むだけ頭に入らない
- CLIを打つのが面倒([k9s](https://k9scli.io/)は便利だけど、まだ使う時ではない)
- Vimを普段から使っているから、Vimから直接Podなどを触れると便利

---
layout: center

---

# デモ

---
layout: center

---


# 仕組み

---
layout: center

---

# `kubectl`でJSONを取得していい感じにしている

```typescript
export async function getResourceAsText(
  resource: Resource,
): Promise<string> {
  const cmd = [
    "kubectl",
    "get",
    resource.type,
  ];

  if (resource.opts?.name) {
    cmd.push(resource.opts.name);
  }
  ...
  if (resource.opts?.format) {
    cmd.push("-o", resource.opts.format);
  }
  if (resource.opts?.fields) {
    cmd.push("--field-selector", resource.opts.fields);
  }
  ...
  const output = await run(cmd);
  return output;
}
```

---
layout: two-cols

---

# 実装例

```ts
const opt = {
  type: "pods",
  opts: {
    namespace: "all",
    format: "json"
  }
};
await getResourceAsText(opt);
```

```ts
const opt = {
  type: "rs",
  opts: { 
    namespace: "default",
    format: "yaml",
    fields: "metadata.name=nginx"
  },
};
await getResourceAsText(opt);
```

::right::

# 実行されるコマンド

```sh
$ kubectl get pods -A -o json








```

```sh
$ kubectl get rs -n default -o yaml \
     --field-selector metadata.name=nginx








```

---
layout: center

---

# カスタマイズ
- `k8s`から取得したJSONデータはVim側で保持しているので、ユーザはそのデータを自由に使える
- つまり、プラグインが提供していない機能も自分でちょっとVim scriptを書けば実装できる
- 例えば、次のようにデバッグコマンドを自分で追加できる
  ```vim
  function! K8sDebugPod() abort
    let pod = b:k8s_pods[line(".")-2]
    call k8s#util#terminal#kubectl('debug', pod.metadata.name, '-it', '--image=busybox', '--', 'sh')
  endfunction
  command! K8sDebugPod :call K8sDebugPod()<CR>
  ```

---
layout: center

---

# 作って学んだこと

- `kubectl`のコマンドを結構覚えた
  - `describe`や`kubectl get event -A -w`でいろんなイベント情報を見れることを知った
  - `kubectl edit`でリソースを直接編集できることを知った
  - `k8s`のopenapi定義を取れることを知った
    ```sh
    kubectl get --raw /openapi/v2
    ```
- Workerに作られたコンテナは`namespace`で区切られていることを知った
  ```sh
  $ nerdctl ps
  CONTAINER ID    IMAGE    COMMAND    CREATED    STATUS    PORTS    NAMES

  $ nerdctl --namespace k8s.io ps
  CONTAINER ID    IMAGE                  COMMAND                 ...  NAMES
  4754ffd642d0    k8s.gcr.io/pause:3.6   "nginx -g daemon off;"  ...  k8s://default/sample-deployment-847b7dfb49-dvd8j
  ```

---
layout: center

---

# ありがとうございました

