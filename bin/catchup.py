#!/bin/env python3

import argparse as ap
import sys
import os
import pathlib as plb

def _args(sysargs: list[str]):
    parser = ap.ArgumentParser()

    parser.add_argument('who', help='abbreviated name of the person you are catching up with')
    parser.add_argument('msg', help='what to communicate about')
    parser.add_argument('-p', '--is-private', action=ap.BooleanOptionalAction)
    parser.add_argument('-public-path', help="env PATH_ADMIN_CATCHUP_PUBLIC by default", default=os.getenv('PATH_ADMIN_CATCHUP_PUBLIC'))
    parser.add_argument('-private-path-base', help="env PATH_ADMIN_CATCHUP_PRIVATE_BASE by default", default=os.getenv('PATH_ADMIN_CATCHUP_PRIVATE_BASE'))
    args = parser.parse_args(sysargs)

    args_dict = vars(args)

    if args_dict['public_path'] is None:
        raise ValueError('public path is not set, you can provide inline or with env PATH_ADMIN_CATCHUP_PUBLIC')
    
    if args_dict['private_path_base'] is None:
        raise ValueError('private path is not set, you can provide inline or with env PATH_ADMIN_CATCHUP_PRIVATE_BASE')

    return args_dict


def _main(sysargs: list[str]):
    args = _args(sysargs)
    
    if args['is_private']:
        file_path = plb.Path(args['private_path_base']) / (args['who'] + ".yaml")
    else:
        file_path = plb.Path(args['public_path'])

    file_path.parent.mkdir(parents=True, exist_ok=True)

    if file_path.exists():
        txt = plb.Path(file_path).read_text()
    else:
        txt = ""

    txt_added = f'{args["who"]}:\n  {args["msg"]}'
    txt_new = txt + "\n" + txt_added

    plb.Path(file_path).write_text(txt_new)

    print(txt_new)
    print(file_path)

if __name__ == '__main__':
    _main(sys.argv[1:])
