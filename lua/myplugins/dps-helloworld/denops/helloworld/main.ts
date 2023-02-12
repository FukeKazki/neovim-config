import { ensureString } from "https://deno.land/x/unknownutil@v1.0.0/mod.ts";
import { Denops, execute } from "./deps.ts";

export async function main(denops: Denops): Promise<void> {
  denops.dispatcher = {
    async echo(text: unknown): Promise<unknown> {
      ensureString(text);
      return await Promise.resolve(text);
    },
  };

  await execute(
    denops,
    `command! -nargs=1 HelloWorldEcho echomsg denops#request('${denops.name}', 'echo', [<q-args>])`,
  );
}
