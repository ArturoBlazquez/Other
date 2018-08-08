from IPython.terminal.prompts import Prompts, Token
import os

class MyPrompt(Prompts):
    def in_prompt_tokens(self, cli=None):
        return [(Token.Prompt, '>')]

    def out_prompt_tokens(self, cli=None):
        return [(Token.Prompt, '')]

ip = get_ipython()
ip.prompts = MyPrompt(ip)
