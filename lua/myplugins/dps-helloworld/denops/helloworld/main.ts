import { Denops } from "https://deno.land/x/denops_std@v1.0.0/mod.ts";
import { execute } from "https://deno.land/x/denops_std@v1.0.0/helper/mod.ts";
import { ensureString } from "https://deno.land/x/unknownutil@v1.0.0/mod.ts";

import { SlackAPI } from "https://deno.land/x/deno_slack_api@0.0.8/mod.ts"

const token = 'xoxb-2268347708272-2237937116486-GVVxr5zKskZYo1A404b7WUzy'
const channel = 'C027WA7N9T2'

// ...or create a client with options
const client = SlackAPI(token);

export async function main(denops: Denops): Promise<void> {
  denops.dispatcher = {
    async echo(text: unknown): Promise<unknown> {
      // `text` が string 型であることを保証する
      ensureString(text);
      return await Promise.resolve(text);
    },
    // slackに投稿する
    async post(text: unknown): Promise<unknown> {
      ensureString(text);
      const res = await client.chat.postMessage({
        text,
        channel,
      });
      return res.ok
    }
  };

  await execute(
    denops,
    `command! -nargs=1 HelloWorldEcho echomsg denops#request('${denops.name}', 'echo', [<q-args>])`
  )
  await execute(
    denops,
    `command! -nargs=1 Slack echomsg denops#request('${denops.name}', 'post', [<q-args>])`
  )
};
