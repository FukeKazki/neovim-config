import { ensureString } from "https://deno.land/x/unknownutil@v1.0.0/mod.ts";
import { SlackAPI } from "https://deno.land/x/deno_slack_api@0.0.8/mod.ts";
import { Denops, execute, vars } from "./deps.ts";

// options.luaでgに設定してるtoken等を取得する
export const getBuildOption = async (denops: Denops) => {
  // const token = await vars.g.get<string>(
  //   denops,
  //   "slack_api_token",
  //   "",
  // );
  // const channel = await vars.g.get<string>(
  //   denops,
  //   "slack_channel",
  //   "",
  // );
  const token = await vars.environment.get(denops, "SLACK_API_TOKEN", "");
  const channel = await vars.environment.get(denops, "SLACK_CHANNEL", "");
  return {
    token,
    channel,
  };
};

export async function main(denops: Denops): Promise<void> {
  denops.dispatcher = {
    async echo(text: unknown): Promise<unknown> {
      ensureString(text);
      return await Promise.resolve(text);
    },
    // slackに投稿する
    async post(text: unknown): Promise<unknown> {
      const option = await getBuildOption(denops);
      const client = SlackAPI(option.token);
      console.log(option);
      ensureString(text);
      const res = await client.chat.postMessage({
        text,
        channel: option.channel,
      });
      return res.ok;
    },
  };

  await execute(
    denops,
    `command! -nargs=1 HelloWorldEcho echomsg denops#request('${denops.name}', 'echo', [<q-args>])`,
  );
  await execute(
    denops,
    `command! -nargs=1 Slack echomsg denops#request('${denops.name}', 'post', [<q-args>])`,
  );
}
