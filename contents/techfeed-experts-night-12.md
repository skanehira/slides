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

# 思考速度でテキスト編集

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

- このセッションは「テキストの編集」に重きを置いて話します
    - プラグインなどの話はしません
- 最後まで聞くとVimが使われ続ける理由がわかります

---
layout: two-cols

---

# 自己紹介

<img src="https://i.gyazo.com/8c3036a0c9c206efd95594efb2ac507e.jpg" width=400 style="margin: 10px">

::right::

# <br>

<br>

- 名前：ゴリラ
- 仕事：エンジニア&社長（最近会社を作りました）
- 趣味：好きな技術（Vim、Go、Rust、TypeScript、Wasmなど）を追っかけたり、筋トレしたり
- SNSも一応やっています
  - Twitter: https://twitter.com/gorilla0513
  - Github: https://github.com/skanehira
  - Zenn: https://zenn.dev/skanehira

---
layout: center

---

# みなさんへの質問

<br>

## テキストを速く編集するには、どうすれば良いと思いますか？

---
layout: center

---

# 雑にぱっと考えると…

<style>
li {
  font-size: 20px;
}
</style>

- タイピングを速くする
- ショートカットを使いこなす
- マウスの操作を素早くする
- キーボードを自作する
- 己の思考を加速させる
- etc...

---
layout: center

---

# テキスト編集時の操作を整理

---
layout: center

---

# テキスト編集時の操作

<style>
li {
  font-size: 20px;
}
</style>

- 文字の選択
- 文字の入力
- 文字の削除
- 文字の検索
- 文字の置換
- カーソル移動

---
layout: center

---

## つまり
## 選択/入力/削除/検索/置換/カーソル移動
## といった操作を素早くできれば編集速度が向上する

---
layout: center

---

## Vimは標準でこれらの操作を素早くできる機能を提供している

---
layout: center

---

## 具体例1: typoの修正

<br>

`index.html`を`indax.html`とtypoしてしまった場合、`2fare`と入力することでサクッと修正できます。

`2fa`で行内にある2つ目の`a`に移動したあと`re`で`a`を`e`に書き換える
![](https://i.gyazo.com/9129b067b3c7127bd72a137f15911472.gif)

---
layout: center

---

## 具体例2: シグニチャが長い関数のコピー

<br>

`do_some_super_awesome_good_things_with_people`をコピーして`do_some_super_awesome_good_things_with_gorilla`という関数を作りたい場合`yipGp$T_cegorilla`と入力することでサクッとコピーできます。

<img src="https://i.gyazo.com/1905a7564308a32ef4614cea16928dd2.gif" width=500>

---
layout: center

---

## 具体例2: シグニチャが長い関数のコピー

<br>

もう少し詳しく解説すると...

- `yip`で関数本体を選択してコピー
- `G`で最後の行に移動
- `p`でコピーした関数をペースト
- `$`で行末に移動
- `T_`でカーソルより左側にある1つ目の`_`の手前(つまり`p`)に移動
- `ce`で`people`を削除
- `gorilla`を入力

ということをやっています。

---
layout: center

---

## 具体例2: シグニチャが長い関数のコピー

<br>

さらに、もう少し詳しく解説すると...

- `yip`は`y`と`ip`に分かれる
    - `y`はヤンク（要はコピー）という`オペレーター`
    - `ip`は段落を表す`テキストオブジェクト`
- `ce`は`c`と`e`に分かれる
    - `c`は指定した範囲のテキストを削除して入力モードに切替える`オペレーター`
    - `e`は次の単語終わりを表す`モーション`

---
layout: center

---

## 具体例2: シグニチャが長い関数のコピー

用語をまとめると、次のようになります。

<br>

| **用語**             | **説明**                                                                                                 |
|----------------------|----------------------------------------------------------------------------------------------------------|
| オペレーター         | ヤンク、削除、変更といったテキストへの"操作"を表している                                                 |
| テキストオブジェクト | テキストを1つのまとまりとして扱う、言わば"範囲"を表している                                              |
| モーション           | カーソルを移動するコマンド、オペレーターと組み合わせて使うと、移動した範囲がテキストへの操作"範囲"になる |

---
layout: center

---

# ポイント

- 操作(オペレーター)と操作対象の範囲(テキストオブジェクト、モーション)選択は、エディタ関係なく普段のテキスト編集でほとんど無意識にみんなやっていること
- Vimはそれを機能まで落とし込んで提供している
- つまり、**Vimを使うと考えた通りに編集が可能である**

---
layout: center

---

# これが思考速度でテキストを編集するということ

---
layout: center

---

# さいごに
- 本セッションで紹介したオペレーター・モーションなどはほんの一握りです
- もっと詳しく知りたい方は手前味噌ですが、以下の連載と本を参考にしてみてください。
  - https://knowledge.sakura.ad.jp/21687
  - https://nextpublishing.jp/book/11839.html
